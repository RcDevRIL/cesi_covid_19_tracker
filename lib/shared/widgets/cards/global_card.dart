import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart' show Modular;
import 'package:responsive_builder/responsive_builder.dart'
    show ResponsiveBuilder;

import 'package:cesi_covid_19_tracker/shared/shared.dart'
    show AppTheme, CoronedCard;
import 'package:cesi_covid_19_tracker/data/models/models.dart' show CovidInfos;
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show AppUtils, locator;
import 'package:cesi_covid_19_tracker/modules/blocs.dart' show CoronedData;

import 'coroned_card.dart';

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
    numbers = locator.get<AppUtils>().computeWeights(
          widget.covidInfos.cases ?? 0,
          widget.covidInfos.deaths ?? 0,
          widget.covidInfos.recovered ?? 0,
          0,
        );
  }

  @override
  void didUpdateWidget(GlobalCard oldWidget) {
    if (oldWidget != widget) {
      numbers = locator.get<AppUtils>().computeWeights(
            widget.covidInfos.cases ?? 0,
            widget.covidInfos.deaths ?? 0,
            widget.covidInfos.recovered ?? 0,
            0,
          );
    }
    super.didUpdateWidget(oldWidget);
  }

  double _resolveStatsWidth(bool isLarge) => isLarge
      ? MediaQuery.of(context).size.width / 2
      : MediaQuery.of(context).size.width - 20;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInfos) {
      final double statsBarWidth =
          _resolveStatsWidth(sizingInfos.isDesktop || sizingInfos.isTablet);
      final CoronedData coronedData = Modular.get<CoronedData>();
      return CoronedCard(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                coronedData.appTextTranslations.globalStats,
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                '${coronedData.appTextTranslations.contaminated.toUpperCase()} : ${locator.get<AppUtils>().formatLargeNumber(widget.covidInfos.cases)}',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .apply(color: Colors.black),
              ),
              Container(
                height: 8.0,
                width: numbers['weightContaminated'] * statsBarWidth,
                decoration: BoxDecoration(
                  color: AppTheme.confirmedColorFill,
                  border: Border.all(color: AppTheme.confirmedColorBorder),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                '${coronedData.appTextTranslations.deaths.toUpperCase()} : ${locator.get<AppUtils>().formatLargeNumber(widget.covidInfos.deaths)}',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .apply(color: Colors.black),
              ),
              Container(
                height: 8.0,
                width: numbers['weightDeath'] * statsBarWidth,
                decoration: BoxDecoration(
                  color: AppTheme.deathsColorFill,
                  border: Border.all(color: AppTheme.deathsColorBorder),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                '${coronedData.appTextTranslations.recovered.toUpperCase()} : ${locator.get<AppUtils>().formatLargeNumber(widget.covidInfos.recovered)}',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .apply(color: Colors.black),
              ),
              Container(
                height: 8.0,
                width: numbers['weightRecovered'] * statsBarWidth,
                decoration: BoxDecoration(
                  color: AppTheme.recoveredColorFill,
                  border: Border.all(color: AppTheme.recoveredColorBorder),
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
