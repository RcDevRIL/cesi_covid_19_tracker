import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/data/models/covid_latest.dart';
import 'package:cesi_covid_19_tracker/data/services/locator.dart';
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show AppUtils;
import 'package:cesi_covid_19_tracker/ui/widgets/widgets.dart'
    show CoronedCard, FailureIcon, NavigationDrawer;
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({
    Key key,
    this.title = aG.AppConstants.defaultAppTitle,
  }) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _confirmedWeight = 0;
  double _recoveredWeight = 0;
  double _deathsWeight = 0;
  StreamController _apiResponseController;

  @override
  void initState() {
    super.initState();
    _apiResponseController = StreamController();
    callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: widget.title.split('\t\t')[0],
            style: Theme.of(context).textTheme.headline1,
            children: [
              TextSpan(
                text: '\t\t' + widget.title.split('\t\t')[1],
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
      drawer: NavigationDrawer(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        primary: true,
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: StreamBuilder(
              stream: _apiResponseController.stream,
              builder: (_, s) {
                print('Has error: ${s.hasError}');
                print('Has data: ${s.hasData}');
                print('Snapshot Data ${s.data}');

                if (s.hasData) {
                  var cL = CovidLatest.fromJson(jsonDecode(s.data));
                  var total = cL.apiResponse['confirmed'] +
                      cL.apiResponse['deaths'] +
                      cL.apiResponse['recovered'];
                  _confirmedWeight = cL.apiResponse['confirmed'] / total;
                  _recoveredWeight = cL.apiResponse['recovered'] / total;
                  _deathsWeight = cL.apiResponse['deaths'] / total;
                  debugPrint('total: $total\n'
                      'confirmed: $_confirmedWeight\n'
                      'recovered: $_recoveredWeight\n'
                      'deaths: $_deathsWeight');
                  return Column(
                    children: <Widget>[
                      CoronedCard(
                        children: <Widget>[
                          Text(
                            'Statistiques Mondiales',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'CONTAMINÉS : ${cL.apiResponse['confirmed']}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .apply(color: Colors.black),
                          ),
                          Container(
                            height: 8.0,
                            width: _confirmedWeight *
                                MediaQuery.of(context).size.width /
                                2,
                            decoration: BoxDecoration(
                              color: aG.AppTheme.confirmedColorFill,
                              border: Border.all(
                                  color: aG.AppTheme.confirmedColorBorder),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'MORTS : ${cL.apiResponse['deaths']}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .apply(color: Colors.black),
                          ),
                          Container(
                            height: 8.0,
                            width: _deathsWeight *
                                MediaQuery.of(context).size.width /
                                2,
                            decoration: BoxDecoration(
                              color: aG.AppTheme.deathsColorFill,
                              border: Border.all(
                                  color: aG.AppTheme.deathsColorBorder),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'GUÉRIS : ${cL.apiResponse['recovered']}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .apply(color: Colors.black),
                          ),
                          Container(
                            height: 8.0,
                            width: _recoveredWeight *
                                MediaQuery.of(context).size.width /
                                2,
                            decoration: BoxDecoration(
                              color: aG.AppTheme.recoveredColorFill,
                              border: Border.all(
                                  color: aG.AppTheme.recoveredColorBorder),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                        ],
                      ),
                    ],
                  );
                }
                if (s.hasError) {
                  return FailureIcon(fail: s.error);
                }
                if (s.connectionState != ConnectionState.done) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!s.hasData && s.connectionState == ConnectionState.done) {
                  return FailureIcon(fail: 'No Data');
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void callApi() {
    locator
        .get<AppUtils>()
        .getWorldLatestSituation()
        .then((value) => _apiResponseController.add(value))
        .catchError((e) => _apiResponseController.addError(e));
  }
}
