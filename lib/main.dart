import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;
import 'package:cesi_covid_19_tracker/ui/pages/dashboard.dart';
import 'package:cesi_covid_19_tracker/ui/pages/home_page.dart';

import 'data/services/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: aG.AppTheme.defaultAppTheme,
      routes: {
        '/': (context) => MyHomePage(),
        '/dashboard': (context) => DashBoard(),
      },
    );
  }
}
