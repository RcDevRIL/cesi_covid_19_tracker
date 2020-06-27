import 'package:flutter/material.dart';
import 'dart:convert' show jsonDecode;
import 'package:cesi_covid_19_tracker/data/services/exceptions/exceptions.dart'
    show CovidNotFoundException;
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show ApiService, CoronedData, locator;
import 'package:cesi_covid_19_tracker/shared/widgets/widgets.dart'
    show CoronedAppBar, CountryCard, FailureCard;
import 'package:cesi_covid_19_tracker/data/models/models.dart'
    show CovidCountryInfos;
import 'package:flutter_modular/flutter_modular.dart';

class DetailsPage extends StatefulWidget {
  final String countryCode;

  const DetailsPage({Key key, @required this.countryCode}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final coronedData = Modular.get<CoronedData>();
    return Scaffold(
      appBar: CoronedAppBar(
        isMobile: MediaQuery.of(context).size.width < 600.0,
        isWatch: MediaQuery.of(context).size.width < 350.0,
        textStyle: Theme.of(context).textTheme.headline1,
      ),
      body: coronedData.getCountryList == null
          ? CircularProgressIndicator()
          : Scrollbar(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: <Widget>[
                  SizedBox(height: 24.0),
                  FutureBuilder(
                    future: locator
                        .get<ApiService>()
                        .getDataFromCountry(widget.countryCode),
                    builder: (_, AsyncSnapshot<String> s) {
                      if (s.hasError) {
                        return s.error.runtimeType == CovidNotFoundException
                            ? FailureCard(
                                fail:
                                    'Country not found or doesn\'t have any COVID-19 related cases.',
                                iconAndTextColor:
                                    Theme.of(context).primaryColor,
                              )
                            : FailureCard(fail: s.error);
                      }
                      if (s.hasData) {
                        print('DETAILS DATA:\n${s.data}');
                        final CovidCountryInfos covidCountryInfos =
                            CovidCountryInfos.fromJson(jsonDecode(s.data));
                        final String countryName = coronedData.getCountryList
                                    .firstWhere((c) =>
                                        c.alpha2Code ==
                                        covidCountryInfos.countryInfo['iso2'])
                                    .translations['fr'] !=
                                null
                            ? coronedData.getCountryList
                                .firstWhere((c) =>
                                    c.alpha2Code ==
                                    covidCountryInfos.countryInfo['iso2'])
                                .translations['fr']
                            : coronedData.getCountryList
                                .firstWhere((c) =>
                                    c.alpha2Code ==
                                    covidCountryInfos.countryInfo['iso2'])
                                .name;
                        return CountryCard(
                          covidCountryInfos: covidCountryInfos,
                          countryName: countryName,
                        );
                      }
                      if (!s.hasData &&
                          s.connectionState == ConnectionState.done) {
                        return FailureCard(fail: 'No Data');
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
