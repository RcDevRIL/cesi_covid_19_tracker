import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/data/services/services.dart';
import 'package:cesi_covid_19_tracker/data/models/models.dart'
    show CovidCountryInfos;
import 'package:cesi_covid_19_tracker/ui/widgets/widgets.dart'
    show CoronedCountryCard, FailureIcon, NavigationDrawer;
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;

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
      appBar: AppBar(
        actions: [
          Image.asset('assets/cesilogo.png'),
        ],
        title: Text(
          aG.AppConstants.defaultAppTitle.split('\n')[0],
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
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
        child: FutureBuilder(
            future: locator.get<AppUtils>().getAllCountriesData(),
            builder: (c, AsyncSnapshot<Map<String, dynamic>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.connectionState == ConnectionState.active)
                return CircularProgressIndicator();
              if (snapshot.connectionState == ConnectionState.none)
                return FailureIcon();
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  List<String> countryList = snapshot.data.entries
                      .firstWhere((e) => e.key == 'csvList')
                      .value;
                  return DropdownButton(
                    key: Key('Country List'),
                    onChanged: (String country) {
                      setState(() {
                        _dropDownValue = country;
                      });
                      call(country.substring(country.length - 2));
                    },
                    hint: Text('Choisissez un pays'),
                    elevation: 2,
                    isExpanded: false,
                    style: Theme.of(c).textTheme.bodyText1,
                    value: _dropDownValue,
                    items: countryList.map((e) {
                      return DropdownMenuItem(
                        child: Text('${e.substring(0, e.length - 3)}'),
                        value: e,
                      );
                    }).toList(),
                  );
                }
                if (snapshot.hasError) {
                  return FailureIcon(
                    fail: snapshot.error.toString(),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              } else
                return FailureIcon();
            }),
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
