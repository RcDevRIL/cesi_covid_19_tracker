import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';

import 'package:cesi_covid_19_tracker/data/models/models.dart' show CovidInfos;
import 'package:cesi_covid_19_tracker/data/services/services.dart';
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;
import 'package:cesi_covid_19_tracker/ui/widgets/widgets.dart' show CoronedCard;

class GlobalCard extends StatefulWidget {
  final CovidInfos covidInfos;

  const GlobalCard({
    Key key,
    @required this.covidInfos,
  }) : super(key: key);

  @override
  _GlobalCardState createState() => _GlobalCardState();
}

class _GlobalCardState extends State<GlobalCard> {
  int total;
  double weightContaminated;
  double weightDeath;
  double weightRecovered;

  @override
  void initState() {
    super.initState();
    computeWeights();
  }

  void computeWeights() {
    total = widget.covidInfos.cases +
        widget.covidInfos.recovered +
        widget.covidInfos.deaths;
    weightContaminated = widget.covidInfos.cases / total;
    weightDeath = widget.covidInfos.deaths / total;
    weightRecovered = widget.covidInfos.recovered / total;
  }

  @override
  void didUpdateWidget(GlobalCard oldWidget) {
    if (oldWidget != widget) {
      computeWeights();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInfos) {
      var margin = sizingInfos.isDesktop || sizingInfos.isTablet
          ? MediaQuery.of(context).size.width / 4
          : 12.0;
      var statsBarWidth = sizingInfos.isDesktop || sizingInfos.isTablet
          ? MediaQuery.of(context).size.width / 2
          : MediaQuery.of(context).size.width - margin - 8.0;

      return CoronedCard(children: <Widget>[
        Text(
          'Statistiques Mondiales',
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          'CONTAMINÉS : ${locator.get<AppUtils>().formatLargeNumber(widget.covidInfos.cases)}',
          style:
              Theme.of(context).textTheme.bodyText2.apply(color: Colors.black),
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
          'MORTS : ${locator.get<AppUtils>().formatLargeNumber(widget.covidInfos.deaths)}',
          style:
              Theme.of(context).textTheme.bodyText2.apply(color: Colors.black),
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
          'GUÉRIS : ${locator.get<AppUtils>().formatLargeNumber(widget.covidInfos.recovered)}',
          style:
              Theme.of(context).textTheme.bodyText2.apply(color: Colors.black),
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
      ]);
    });
  }
}
