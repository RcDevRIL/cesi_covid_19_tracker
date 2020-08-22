import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart' show Consumer;

import 'package:cesi_covid_19_tracker/data/services/exceptions/exceptions.dart'
    show APIException, APIUnreachedException;
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
            if (cD.apiErrorGlobal != null) {
              switch (cD.apiErrorGlobal.runtimeType) {
                case APIUnreachedException:
                  return Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: FailureCard(
                      fail:
                          'Data source is not available. Please try again later.',
                      iconAndTextColor: Theme.of(context).primaryColor,
                    ),
                  );
                  break;
                case APIException:
                  return Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: FailureCard(
                      fail:
                          'Cannot retrieve data. Please check your internet connection.',
                      iconAndTextColor: Theme.of(context).primaryColor,
                    ),
                  );
                  break;
                default:
                  return Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: FailureCard(fail: '${cD.apiErrorGlobal}'),
                  );
                  break;
              }
            } else {
              return Scrollbar(
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
          }
        },
      ),
    );
  }
}
