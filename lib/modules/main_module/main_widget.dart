import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cesi_covid_19_tracker/shared/shared.dart';
import 'package:cesi_covid_19_tracker/shared/constants/app_globals.dart' as aG;

class CoronedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CORONED',
      localizationsDelegates: [
        const AppBarTooltipsText(),
      ],
      theme: aG.AppTheme.defaultAppTheme,
      initialRoute: '/dashboard',
      onGenerateRoute: Modular.generateRoute,
      navigatorKey: Modular.navigatorKey,
    );
  }
}
