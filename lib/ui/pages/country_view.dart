import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/data/services/services.dart';
import 'package:cesi_covid_19_tracker/data/models/models.dart'
    show Country, CovidCountryInfos;
import 'package:cesi_covid_19_tracker/ui/widgets/widgets.dart'
    show CountryCard, FailureIcon, NavigationDrawer;
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;
import 'package:provider/provider.dart';

class CountryView extends StatefulWidget {
  @override
  _CountryViewState createState() => _CountryViewState();
}

class _CountryViewState extends State<CountryView> {
  StreamController<String> _covidApiResponseController;

  @override
  void initState() {
    super.initState();
    _covidApiResponseController = StreamController();
  }

  @override
  Widget build(BuildContext context) {
    final coronedData = Provider.of<CoronedData>(context);
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
        children: _buildChildren(coronedData),
      ),
    );
  }

  List<Widget> _buildChildren(CoronedData coronedData) {
    var children = <Widget>[
      SizedBox(
        height: 24.0,
      ),
    ];
    children.add(
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          coronedData.getCountryList != null
              ? coronedData.getCountryList.isNotEmpty
                  ? DropdownButton<Country>(
                      key: Key('Country List'),
                      onChanged: (Country country) {
                        coronedData.setSelectedCountry(country);
                        getCountryData(country.alpha2Code);
                      },
                      hint: Text('Choisissez un pays'),
                      elevation: 2,
                      isExpanded: false,
                      style: Theme.of(context).textTheme.bodyText1,
                      value: coronedData.getSelectedCountry,
                      items: coronedData.getCountryList.map((e) {
                        return DropdownMenuItem(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              '${e.name}',
                            ),
                          ),
                          value: e,
                        );
                      }).toList(),
                    )
                  : CircularProgressIndicator()
              : FailureIcon(fail: 'How is this even possible?'),
          StreamBuilder<String>(
            stream: _covidApiResponseController.stream,
            builder: (_, AsyncSnapshot<String> s) {
              print('Has error: ${s.hasError}');
              print('Has data: ${s.hasData}');
              if (s.hasError) {
                return FailureIcon(fail: s.error);
              }
              if (s.hasData) {
                print('Snapshot Data ${s.data}');
                return CountryCard(
                  covidCountryInfos:
                      CovidCountryInfos.fromJson(jsonDecode(s.data)),
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
          SizedBox(
            height: 24.0,
          ),
        ],
      ),
    );
    return children;
  }

  void getCountryData(String countryCode) {
    locator
        .get<ApiService>()
        .getDataFromCountry(countryCode)
        .then((value) => _covidApiResponseController.add(value))
        .catchError((e) => _covidApiResponseController.addError(e));
  }
}
