import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/data/models/navbar_item_model.dart';

class AppTheme {
  static ThemeData defaultAppTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    appBarTheme: AppBarTheme(
      color: Colors.blueGrey,
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 1.0,
      brightness: Brightness.light,
      actionsIconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: Colors.white70,
      ),
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
      bodyText2: TextStyle(
        color: Colors.white70,
      ),
    ),
  );
}

class AppConstants {
  static const String defaultAppTitle = 'CORONED\t\tA covid-19 info app';

  static const List<NavBarItemModel> navItems = [
    NavBarItemModel(
      title: 'HOME',
      iconData: Icons.wb_iridescent,
      navigationPath: '/',
    ),
    NavBarItemModel(
      title: 'DASHBOARD',
      iconData: Icons.assignment,
      navigationPath: '/dashboard',
    )
  ];
}
