import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/data/models/covid_infos.dart';
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;
import 'package:responsive_builder/responsive_builder.dart';
import 'package:cesi_covid_19_tracker/data/services/services.dart';

class CoronedGlobalCard extends StatelessWidget {
  final CovidInfos covidInfos;

  const CoronedGlobalCard({
    Key key,
    @required this.covidInfos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfos) {
        var margin = sizingInfos.isDesktop || sizingInfos.isTablet
            ? MediaQuery.of(context).size.width / 4
            : 12.0;
        var statsBarWidth = sizingInfos.isDesktop || sizingInfos.isTablet
            ? MediaQuery.of(context).size.width / 2
            : MediaQuery.of(context).size.width - margin - 8.0;
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
                Text(
                  'Statistiques Mondiales',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'CONTAMINÉS : ${locator.get<AppUtils>().formatLargeNumber(covidInfos.cases)}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .apply(color: Colors.black),
                ),
                Container(
                  height: 8.0,
                  width: statsBarWidth,
                  decoration: BoxDecoration(
                    color: aG.AppTheme.confirmedColorFill,
                    border: Border.all(color: aG.AppTheme.confirmedColorBorder),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'MORTS : ${locator.get<AppUtils>().formatLargeNumber(covidInfos.deaths)}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .apply(color: Colors.black),
                ),
                Container(
                  height: 8.0,
                  width: statsBarWidth,
                  decoration: BoxDecoration(
                    color: aG.AppTheme.deathsColorFill,
                    border: Border.all(color: aG.AppTheme.deathsColorBorder),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'GUÉRIS : ${locator.get<AppUtils>().formatLargeNumber(covidInfos.recovered)}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .apply(color: Colors.black),
                ),
                Container(
                  height: 8.0,
                  width: statsBarWidth,
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
      },
    );
  }
}
