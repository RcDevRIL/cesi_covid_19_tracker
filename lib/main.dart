import 'package:flutter/material.dart';
  
import 'package:provider/provider.dart';

import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show CoronedData, setupLocator;
import 'package:cesi_covid_19_tracker/ui/pages/pages.dart'
    show CountryView, CovidFaq, Dashboard;
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
        routes: {
          '/dashboard': (context) => Dashboard(),
          '/country': (context) => CountryView(),
          '/faq': (context) => CovidFaq(),
        },
        home: Dashboard(),
      ),
    );
  }
}
