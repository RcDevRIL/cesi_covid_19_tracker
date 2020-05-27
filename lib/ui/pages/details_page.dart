import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show ApiService, locator;
import 'package:cesi_covid_19_tracker/ui/widgets/widgets.dart'
    show CountryCard, FailureIcon;
import 'package:cesi_covid_19_tracker/data/models/models.dart'
    show Country, CovidCountryInfos;
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;

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
      appBar: AppBar(
        actions: [
          Image.asset('assets/cesilogo.png'),
        ],
        title: Text(
          aG.AppConstants.defaultAppTitle.split('\n')[0],
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
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
                return FailureIcon(fail: s.error);
              }
              if (s.hasData) {
                return CountryCard(
                  covidCountryInfos:
                      CovidCountryInfos.fromJson(jsonDecode(s.data)),
                );
              }
              if (!s.hasData && s.connectionState == ConnectionState.done) {
                return FailureIcon(fail: 'No Data');
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
