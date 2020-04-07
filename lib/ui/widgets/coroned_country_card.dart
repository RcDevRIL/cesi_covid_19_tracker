import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/data/models/covid_country_infos.dart';
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;
import 'package:responsive_builder/responsive_builder.dart';

class CoronedCountryCard extends StatelessWidget {
  final CovidCountryInfos covidCountryInfos;
  const CoronedCountryCard({
    Key key,
    @required this.covidCountryInfos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInfos) {
      var margin = sizingInfos.isDesktop || sizingInfos.isTablet
          ? MediaQuery.of(context).size.width / 4
          : 12.0;
      var statsBarWidth = sizingInfos.isDesktop || sizingInfos.isTablet
          ? MediaQuery.of(context).size.width / 2
          : MediaQuery.of(context).size.width - margin - 8.0;
      var total = covidCountryInfos.cases + covidCountryInfos.recovered + covidCountryInfos.deaths;
        var weightContaminated = covidCountryInfos.cases / total;
        var weightDeath = covidCountryInfos.deaths / total;
        var weightRecovered = covidCountryInfos.recovered / total;

      return Card(
        margin: EdgeInsets.symmetric(
          horizontal: margin,
        ),
        elevation: 4.0,
        borderOnForeground: true,
        color: Colors.white60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(
            width: 1.0,
            style: BorderStyle.solid,
            color: Colors.blueGrey,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.network(
                    '${covidCountryInfos.countryInfo['flag']}',
                    height: 50.0,
                    width: 50.0,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    '${covidCountryInfos.country}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'CONTAMINÉS : ${covidCountryInfos.cases}',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .apply(color: Colors.black),
              ),
              Container(
                height: 8.0,
                width: weightContaminated * statsBarWidth,
                decoration: BoxDecoration(
                  color: aG.AppTheme.confirmedColorFill,
                  border: Border.all(color: aG.AppTheme.confirmedColorBorder),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'MORTS : ${covidCountryInfos.deaths}',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .apply(color: Colors.black),
              ),
              Container(
                height: 8.0,
                width: weightDeath * statsBarWidth,
                decoration: BoxDecoration(
                  color: aG.AppTheme.deathsColorFill,
                  border: Border.all(color: aG.AppTheme.deathsColorBorder),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'GUÉRIS : ${covidCountryInfos.recovered}',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .apply(color: Colors.black),
              ),
              Container(
                height: 8.0,
                width: weightRecovered * statsBarWidth,
                decoration: BoxDecoration(
                  color: aG.AppTheme.recoveredColorFill,
                  border: Border.all(color: aG.AppTheme.recoveredColorBorder),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
            ],
          ),
        ),
      );
    });
  }
}
