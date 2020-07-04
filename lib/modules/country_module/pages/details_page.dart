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
import 'package:cesi_covid_19_tracker/shared/extensions/extensions.dart'
    show SizeBreakpoint;
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
    return Scaffold(
      appBar: CoronedAppBar(
        isMobile: context.isMobile,
        isWatch: context.isWatch,
        textStyle: Theme.of(context).textTheme.headline1,
      ),
      body: Consumer<CoronedData>(builder: (_, cD) {
        if (cD.appTextTranslations == null)
          return Center(child: CircularProgressIndicator());
        final _currentTranslationCode = cD.appLanguageCode.toLowerCase();
        return cD.getCountryList == null
            ? Center(child: CircularProgressIndicator())
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
                          final String countryName = cD.getCountryList
                                      .firstWhere((c) =>
                                          c.alpha2Code ==
                                          covidCountryInfos.countryInfo['iso2'])
                                      .translations[_currentTranslationCode] !=
                                  null
                              ? cD.getCountryList
                                  .firstWhere((c) =>
                                      c.alpha2Code ==
                                      covidCountryInfos.countryInfo['iso2'])
                                  .translations[_currentTranslationCode]
                              : cD.getCountryList
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
              );
      }),
    );
  }
}
