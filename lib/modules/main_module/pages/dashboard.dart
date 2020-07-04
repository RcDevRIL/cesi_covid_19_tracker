import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart' show Consumer;

import 'package:cesi_covid_19_tracker/shared/shared.dart'
    show
        AppConstants,
        CoronedAppBar,
        FailureCard,
        GlobalCard,
        NavigationDrawer,
        SizeBreakpoint;
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show ApiService, locator;
import 'package:cesi_covid_19_tracker/data/models/models.dart' show CovidInfos;
import 'package:cesi_covid_19_tracker/modules/blocs.dart' show CoronedData;

class Dashboard extends StatefulWidget {
  final String title;

  Dashboard({
    Key key,
    this.title = AppConstants.defaultAppTitle,
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
      appBar: CoronedAppBar(
        isMobile: context.isMobile,
        isWatch: context.isWatch,
        textStyle: Theme.of(context).textTheme.headline1,
      ),
      drawer: NavigationDrawer(),
      body: Consumer<CoronedData>(
        builder: (_, cD) {
          if (cD.appTextTranslations == null)
            return Center(child: CircularProgressIndicator());
          return StreamBuilder(
            stream: _apiResponseController.stream,
            builder: (_, s) {
              if (s.hasData) {
                return Scrollbar(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 24.0,
                        ),
                        child: GlobalCard(
                          covidInfos: CovidInfos.fromJson(
                            jsonDecode(s.data),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (s.hasError) {
                return FailureCard(fail: s.error);
              }
              if (s.connectionState != ConnectionState.done) {
                return Center(child: CircularProgressIndicator());
              }
              if (!s.hasData && s.connectionState == ConnectionState.done) {
                return FailureCard(fail: 'No Data');
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
    );
  }

  void callApi() {
    locator
        .get<ApiService>()
        .getWorldLatestSituation()
        .then((value) => _apiResponseController.add(value))
        .catchError((e) => _apiResponseController.addError(e));
  }
}
