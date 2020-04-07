import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/data/services/locator.dart';
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show AppUtils;
import 'package:cesi_covid_19_tracker/data/models/covid_infos.dart';
import 'package:cesi_covid_19_tracker/ui/widgets/widgets.dart'
    show CoronedGlobalCard, FailureIcon, NavigationDrawer;
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;

class Dashboard extends StatefulWidget {
  final String title;

  Dashboard({
    Key key,
    this.title = aG.AppConstants.defaultAppTitle,
  }) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
                  return CoronedGlobalCard(
                    covidInfos: CovidInfos.fromJson(jsonDecode(s.data)),
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
