import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData defaultAppTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blue,
  );
}

class AppConstants {
  static const String defaultAppTitle = 'CORONED\t\tA covid-19 info app';

  static const Map<String,IconData> navItems={
    'HOME': Icons.wb_iridescent,
    'DASHBOARD': Icons.assignment,
  };
}
