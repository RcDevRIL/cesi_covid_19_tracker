import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;
import 'package:cesi_covid_19_tracker/ui/pages/pages.dart';

import 'data/services/locator.dart';

void main() {
  setupLocator();
  runApp(CoronedApp());
}

class CoronedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CORONED',
      theme: aG.AppTheme.defaultAppTheme,
      routes: {
        '/dashboard': (context) => Dashboard(),
        '/country': (context) => CountryView(),
      },
      home: Dashboard(),
    );
  }
}
