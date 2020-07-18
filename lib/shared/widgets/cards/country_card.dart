import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart' show Consumer;
import 'package:responsive_builder/responsive_builder.dart'
    show ResponsiveBuilder;

import 'package:cesi_covid_19_tracker/shared/shared.dart'
    show AppTheme, CoronedCard;
import 'package:cesi_covid_19_tracker/data/models/models.dart'
    show CovidCountryInfos;
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show AppUtils, locator;
import 'package:cesi_covid_19_tracker/modules/blocs.dart' show CoronedData;

import 'coroned_card.dart';

class CountryCard extends StatefulWidget {
  final CovidCountryInfos covidCountryInfos;
  final String countryName;
  const CountryCard({
    Key key,
    @required this.covidCountryInfos,
    this.countryName,
  }) : super(key: key);

  @override
  _CountryCardState createState() => _CountryCardState();
}

class _CountryCardState extends State<CountryCard> {
  Map<String, num> numbers;

  @override
  void initState() {
    super.initState();
    numbers = locator.get<AppUtils>().computeWeights(
          widget.covidCountryInfos.cases ?? 0,
          widget.covidCountryInfos.deaths ?? 0,
          widget.covidCountryInfos.recovered ?? 0,
          0,
        );
  }

  @override
  void didUpdateWidget(CountryCard oldWidget) {
    if (oldWidget != widget) {
      numbers = locator.get<AppUtils>().computeWeights(
            widget.covidCountryInfos.cases ?? 0,
            widget.covidCountryInfos.deaths ?? 0,
            widget.covidCountryInfos.recovered ?? 0,
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
      var statsBarWidth =
          _resolveStatsWidth(sizingInfos.isDesktop || sizingInfos.isTablet);

      return Consumer<CoronedData>(
        builder: (context, cD) => CoronedCard(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.network(
                      '${widget.covidCountryInfos.countryInfo['flag']}',
                      height: 50.0,
                      width: 50.0,
                      fit: BoxFit.contain,
                      errorBuilder: (_, e, stacktrace) => Image.asset(
                        'assets/img/missing_flag.png',
                        height: 50.0,
                        width: 50.0,
                        fit: BoxFit.contain,
                        semanticLabel: 'Unknown flag',
                      ),
                      frameBuilder: (context, child, frame, wasLoaded) {
                        if (wasLoaded) {
                          return child;
                        }
                        return frame == null
                            ? Image.asset(
                                'assets/img/missing_flag.png',
                                height: 50.0,
                                width: 50.0,
                                fit: BoxFit.contain,
                                semanticLabel: 'Unknown flag',
                              )
                            : child;
                      },
                      filterQuality: FilterQuality.low,
                      semanticLabel:
                          '${widget.countryName ?? widget.covidCountryInfos.country} flag',
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      '${widget.countryName ?? widget.covidCountryInfos.country}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  '${cD.appTextTranslations.contaminated.toUpperCase()} : ${locator.get<AppUtils>().formatLargeNumber(widget.covidCountryInfos.cases)}',
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
                  '${cD.appTextTranslations.deaths.toUpperCase()} : ${locator.get<AppUtils>().formatLargeNumber(widget.covidCountryInfos.deaths)}',
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
                  '${cD.appTextTranslations.recovered.toUpperCase()} : ${locator.get<AppUtils>().formatLargeNumber(widget.covidCountryInfos.recovered)}',
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
        ),
      );
    });
  }
}
