import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/data/models/navbar_item_model.dart';

class AppTheme {
  static ThemeData defaultAppTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blue,
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
