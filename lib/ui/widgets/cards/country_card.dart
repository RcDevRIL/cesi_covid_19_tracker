import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:cesi_covid_19_tracker/data/models/models.dart'
    show CovidCountryInfos;
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show AppUtils, locator;
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;
import 'package:cesi_covid_19_tracker/ui/widgets/widgets.dart' show CoronedCard;

class CountryCard extends StatefulWidget {
  final CovidCountryInfos covidCountryInfos;
  const CountryCard({
    Key key,
    @required this.covidCountryInfos,
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
        widget.covidCountryInfos.cases,
        widget.covidCountryInfos.recovered,
        widget.covidCountryInfos.deaths);
  }

  @override
  void didUpdateWidget(CountryCard oldWidget) {
    if (oldWidget != widget) {
      numbers = locator.get<AppUtils>().computeWeights(
          widget.covidCountryInfos.cases,
          widget.covidCountryInfos.recovered,
          widget.covidCountryInfos.deaths);
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
        Row(
          children: <Widget>[
            Image.network(
              '${widget.covidCountryInfos.countryInfo['flag']}',
              height: 50.0,
              width: 50.0,
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              '${widget.covidCountryInfos.country}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          'CONTAMINÉS : ${locator.get<AppUtils>().formatLargeNumber(widget.covidCountryInfos.cases)}',
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
          'MORTS : ${locator.get<AppUtils>().formatLargeNumber(widget.covidCountryInfos.deaths)}',
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
          'GUÉRIS : ${locator.get<AppUtils>().formatLargeNumber(widget.covidCountryInfos.recovered)}',
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
