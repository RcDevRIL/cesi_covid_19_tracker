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
  Map<String, num> numbers;

  @override
  void initState() {
    super.initState();
    numbers = locator.get<AppUtils>().computeWeights(widget.covidInfos.cases,
        widget.covidInfos.recovered, widget.covidInfos.deaths);
  }

  @override
  void didUpdateWidget(GlobalCard oldWidget) {
    if (oldWidget != widget) {
      numbers = locator.get<AppUtils>().computeWeights(widget.covidInfos.cases,
          widget.covidInfos.recovered, widget.covidInfos.deaths);
    }
    super.didUpdateWidget(oldWidget);
  }

  double _resolveStatsWidth(bool isLarge) => isLarge
      ? MediaQuery.of(context).size.width / 2
      : MediaQuery.of(context).size.width - 20;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInfos) {
      var statsBarWidth =
          _resolveStatsWidth(sizingInfos.isDesktop || sizingInfos.isTablet);

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
          width: numbers['weightContaminated'] * statsBarWidth,
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
          width: numbers['weightDeath'] * statsBarWidth,
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
          width: numbers['weightRecovered'] * statsBarWidth,
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
