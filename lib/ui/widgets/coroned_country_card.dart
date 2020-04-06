import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/data/models/covid_country_infos.dart';
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;

class CoronedCountryCard extends StatelessWidget {
  final List<Widget> children;
  final CovidCountryInfos covidCountryInfos;
  const CoronedCountryCard({
    Key key,
    this.children,
    this.covidCountryInfos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 4,
      ),
      elevation: 4.0,
      borderOnForeground: true,
      color: Colors.white60,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
        side: BorderSide(
          width: 1.0,
          style: BorderStyle.solid,
          color: Colors.blue,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${covidCountryInfos.country}',
              style: Theme.of(context).textTheme.headline4,
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
              width: MediaQuery.of(context).size.width / 2,
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
              width: MediaQuery.of(context).size.width / 2,
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
              width: MediaQuery.of(context).size.width / 2,
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
  }
}
