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
import 'package:cesi_covid_19_tracker/modules/blocs.dart' show CoronedData;

class Dashboard extends StatelessWidget {
  final String title;

  Dashboard({
    Key key,
    this.title = AppConstants.defaultAppTitle,
  }) : super(key: key);

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
          if (!cD.isLoaded) {
            return Center(child: CircularProgressIndicator());
          } else {
            return cD.apiErrorGlobal != null
                ? FailureCard(fail: '${cD.apiErrorGlobal}')
                : Scrollbar(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 24.0,
                          ),
                          child: GlobalCard(
                            covidInfos: cD.getGlobalInfos,
                          ),
                        ),
                      ],
                    ),
                  );
          }
        },
      ),
    );
  }
}
