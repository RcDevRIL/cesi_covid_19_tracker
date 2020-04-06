import 'dart:async';
import 'dart:convert';
import 'package:cesi_covid_19_tracker/data/models/covid_country_infos.dart';
import 'package:cesi_covid_19_tracker/ui/widgets/coroned_country_card.dart';
import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/ui/widgets/widgets.dart'
    show FailureIcon, NavigationDrawer;
import 'package:cesi_covid_19_tracker/data/services/locator.dart';
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show AppUtils;
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;

class CountryView extends StatefulWidget {
  @override
  _CountryViewState createState() => _CountryViewState();
}

class _CountryViewState extends State<CountryView> {
  String _dropDownValue;
  String _apiResponse;
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
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: aG.AppConstants.defaultAppTitle.split('\t\t')[0],
            style: Theme.of(context).textTheme.headline1,
            children: [
              TextSpan(
                text: '\t\t' + aG.AppConstants.defaultAppTitle.split('\t\t')[1],
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
      drawer: NavigationDrawer(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        primary: true,
        shrinkWrap: true,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: _buildChildren()
                ..add(
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
                        var cCL =
                            CovidCountryInfos.fromJson(jsonDecode(s.data));
                        return Column(
                          children: <Widget>[
                            CoronedCountryCard(
                              covidCountryInfos: cCL,
                            ),
                          ],
                        );
                      }
                      if (s.connectionState != ConnectionState.done) {
                        return Container();
                      }
                      if (!s.hasData &&
                          s.connectionState == ConnectionState.done) {
                        return FailureIcon(fail: 'No Data');
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
            ),
          ),
        ],
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
          value: _dropDownValue,
          items: ['FR', 'US', 'UK', 'ERR']
              .map((e) => DropdownMenuItem(
                    child: Text('$e'),
                    value: e,
                  ))
              .toList(),
        ),
      ),
    );
    children.add(
      SizedBox(
        height: 24.0,
      ),
    );
    children.add(Text(
      _apiResponse ?? ' ',
      style: TextStyle(color: Colors.black),
    ));
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
