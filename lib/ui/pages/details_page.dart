import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:cesi_covid_19_tracker/data/services/exceptions/exceptions.dart'
    show CovidNotFoundException;
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show ApiService, locator;
import 'package:cesi_covid_19_tracker/ui/widgets/widgets.dart'
    show CoronedAppBar, CountryCard, FailureCard;
import 'package:cesi_covid_19_tracker/data/models/models.dart'
    show Country, CovidCountryInfos;

class DetailsPage extends StatefulWidget {
  final Country country;

  const DetailsPage({Key key, this.country}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoronedAppBar(appBar: AppBar()),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(height: 24.0),
          FutureBuilder(
            future: locator
                .get<ApiService>()
                .getDataFromCountry(widget.country.alpha2Code),
            builder: (_, AsyncSnapshot<String> s) {
              if (s.hasError) {
                return s.error.runtimeType == CovidNotFoundException
                    ? FailureCard(
                        fail:
                            'Country not found or doesn\'t have any COVID-19 related cases.',
                        iconAndTextColor: Theme.of(context).primaryColor)
                    : FailureCard(fail: s.error);
              }
              if (s.hasData) {
                return CountryCard(
                  covidCountryInfos:
                      CovidCountryInfos.fromJson(jsonDecode(s.data)),
                );
              }
              if (!s.hasData && s.connectionState == ConnectionState.done) {
                return FailureCard(fail: 'No Data');
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
