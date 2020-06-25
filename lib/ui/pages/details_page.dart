import 'package:flutter/material.dart';
import 'dart:convert' show jsonDecode;
import 'package:cesi_covid_19_tracker/data/services/exceptions/exceptions.dart'
    show CovidNotFoundException;
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show ApiService, CoronedData, locator;
import 'package:cesi_covid_19_tracker/ui/widgets/widgets.dart'
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
      appBar: CoronedAppBar(appBar: AppBar()),
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
                        final String displayName = coronedData
                                    .getSelectedCountry !=
                                null
                            ? coronedData.getSelectedCountry.translations['fr']
                            : coronedData.getCountryList
                                .firstWhere((c) =>
                                    c.alpha2Code ==
                                    covidCountryInfos.countryInfo['iso2'])
                                .translations['fr'];
                        return CountryCard(
                          covidCountryInfos: covidCountryInfos,
                          countryName: displayName,
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
