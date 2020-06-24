import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show ChangeNotifierProvider;
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show CoronedData, setupLocator;
import 'package:cesi_covid_19_tracker/ui/pages/pages.dart'
    show CountryView, CovidFaq, Dashboard;
import 'package:cesi_covid_19_tracker/shared/shared.dart'
    show NoTransitionRouteBuilder;
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;

void main() {
  setupLocator();
  runApp(CoronedApp());
}

class CoronedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CoronedData(),
      child: MaterialApp(
        title: 'CORONED',
        theme: aG.AppTheme.defaultAppTheme,
        initialRoute: '/dashboard',
        onGenerateRoute: (routeSettings) {
          switch (routeSettings.name) {
            case '/dashboard':
              return NoTransitionRouteBuilder(
                page: Dashboard(),
              );
              break;
            case '/country':
              return NoTransitionRouteBuilder(
                page: CountryView(),
              );
              break;
            case '/faq':
              return NoTransitionRouteBuilder(
                page: CovidFaq(),
              );
              break;
            case '/about':
              return NoTransitionRouteBuilder(
                page: LicensePage(
                  applicationName: aG.AppConstants.applicationName,
                  applicationVersion: aG.AppConstants.applicationVersion,
                  applicationIcon: Image.asset(
                    aG.AppConstants.applicationIcon,
                    height: 50.0,
                    width: 50.0,
                    fit: BoxFit.contain,
                  ),
                  applicationLegalese: aG.AppConstants.applicationLegalese,
                ),
              );
              break;
            default:
              return NoTransitionRouteBuilder(
                page: //TODO UnknownPage(),
                    Dashboard(),
              );
              break;
          }
        },
      ),
    );
  }
}
