import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/data/services/services.dart';
import 'package:cesi_covid_19_tracker/data/models/models.dart'
    show CovidCountryInfos;
import 'package:cesi_covid_19_tracker/ui/widgets/widgets.dart'
    show CoronedAppBar, CoronedCountryCard, FailureIcon, NavigationDrawer;

class CountryView extends StatefulWidget {
  @override
  _CountryViewState createState() => _CountryViewState();
}

class _CountryViewState extends State<CountryView> {
  String _dropDownValue;
  StreamController<String> _apiResponseController;

  @override
  void initState() {
    super.initState();
    _apiResponseController = StreamController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: CoronedAppBar(appBar: AppBar()),
      drawer: NavigationDrawer(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        primary: true,
        shrinkWrap: true,
        children: _buildChildren(),
      ),
    );
  }

  List<Widget> _buildChildren() {
    var children = <Widget>[
      SizedBox(
        height: 24.0,
      ),
    ];
    children.add(
      Center(
        child: DropdownButton(
          key: Key('Country List'),
          onChanged: (String countryCode) {
            setState(() {
              _dropDownValue = countryCode;
            });
            call(countryCode);
          },
          hint: Text('Choisissez un pays'),
          elevation: 2,
          isExpanded: false,
          style: Theme.of(context).textTheme.bodyText1,
          value: _dropDownValue,
          items: ['FR', 'US', 'UK', 'CH']
              .map((e) => DropdownMenuItem(
                    child: Text('$e'),
                    value: e,
                  ))
              .toList(),
        ),
      ),
    );
    children.add(
      StreamBuilder<String>(
        stream: _apiResponseController.stream,
        builder: (_, AsyncSnapshot<String> s) {
          print('Has error: ${s.hasError}');
          print('Has data: ${s.hasData}');
          print('Snapshot Data ${s.data}');
          if (s.hasError) {
            return FailureIcon(fail: s.error);
          }
          if (s.hasData) {
            return CoronedCountryCard(
              covidCountryInfos: CovidCountryInfos.fromJson(jsonDecode(s.data)),
            );
          }
          if (s.connectionState != ConnectionState.done) {
            return Container();
          }
          if (!s.hasData && s.connectionState == ConnectionState.done) {
            return FailureIcon(fail: 'No Data');
          } else {
            return Container();
          }
        },
      ),
    );
    children.add(
      SizedBox(
        height: 24.0,
      ),
    );
    return children;
  }

  void call(String countryCode) {
    locator
        .get<AppUtils>()
        .getDataFromCountry(countryCode)
        .then((value) => _apiResponseController.add(value))
        .catchError((e) => _apiResponseController.addError(e));
  }
}
