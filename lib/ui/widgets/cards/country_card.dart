import 'package:cesi_covid_19_tracker/ui/widgets/cards/coroned_card.dart';
import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';

import 'package:cesi_covid_19_tracker/data/models/models.dart'
    show CovidCountryInfos;
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show AppUtils, locator;
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;

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
    total = widget.covidCountryInfos.cases +
        widget.covidCountryInfos.recovered +
        widget.covidCountryInfos.deaths;
    weightContaminated = widget.covidCountryInfos.cases / total;
    weightDeath = widget.covidCountryInfos.deaths / total;
    weightRecovered = widget.covidCountryInfos.recovered / total;
  }

  @override
  void didUpdateWidget(CountryCard oldWidget) {
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
          'MORTS : ${locator.get<AppUtils>().formatLargeNumber(widget.covidCountryInfos.deaths)}',
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
          'GUÉRIS : ${locator.get<AppUtils>().formatLargeNumber(widget.covidCountryInfos.recovered)}',
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
