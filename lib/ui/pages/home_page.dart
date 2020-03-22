import 'dart:async';
import 'dart:convert';
import 'package:cesi_covid_19_tracker/data/models/covid_latest.dart';
import 'package:cesi_covid_19_tracker/ui/widgets/coroned_card.dart';
import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/data/services/locator.dart';
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
  double _amount = 0;
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
          SingleChildScrollView(
            child: Column(
              children: _buildChildren(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildChildren() {
    List<Widget> children = [
      SizedBox(
        height: 24.0,
      ),
    ];
    children.add(
      CoronedCard(
        children: <Widget>[
          Text(
            'Statistiques Mondiales',
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            'CAS CONFIRMES',
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .apply(color: Colors.black),
          ),
          StreamBuilder(
            stream: _apiResponseController.stream,
            builder: (_, s) {
              print('Has error: ${s.hasError}');
              print('Has data: ${s.hasData}');
              print('Snapshot Data ${s.data}');

              if (s.hasData) {
                CovidLatest cL = CovidLatest.fromJson(jsonDecode(s.data));
                _amount = cL.apiResponse['confirmed'] / 1000;
                return AnimatedContainer(
                  width: _amount,
                  color: Colors.amber,
                  duration: Duration(milliseconds: 250),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      '${cL.apiResponse['confirmed']}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 12.0, color: Colors.white),
                    ),
                  ),
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
        ],
      ),
    );

    children.add(
      SizedBox(
        height: 24.0,
      ),
    );
    return children;
  }

  void callApi() {
    locator
        .get<AppUtils>()
        .getWorldLatestSituation()
        .then((value) => _apiResponseController.add(value))
        .catchError((e) => _apiResponseController.addError(e));
  }
}
