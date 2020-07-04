import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData defaultAppTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blueGrey,
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.white),
      actionsIconTheme: IconThemeData(color: Colors.white),
      elevation: 1.0,
      centerTitle: false,
    ),
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    focusColor: Colors.transparent,
    highlightColor: Colors.transparent,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: Colors.white70,
      ),
      headline4: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      headline5: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
      ),
      caption: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w300,
      ),
    ),
  );
  static const Color confirmedColorFill = Color(0xFFFFE6CC);
  static const Color confirmedColorBorder = Color(0xFFD79B00);
  static const Color recoveredColorFill = Color(0xFFD5E8D4);
  static const Color recoveredColorBorder = Color(0xFF82B366);
  static const Color deathsColorFill = Color(0xFFF8CECC);
  static const Color deathsColorBorder = Color(0xFFB85450);
}

class AppConstants {
  static const String defaultAppTitle = '$applicationName\nA covid-19 info app';
  static const String applicationName = 'CORONED';
  static const String applicationVersion = '1.7.0+1';
  static const String applicationIcon = 'assets/img/virus-logo.png';
  static const String cesiDijonUrl = 'https://dijon.cesi.fr/';
  static const String repositoryUrl =
      'https://www.github.com/RcDevRIL/cesi_covid_19_tracker';
  static const List<Locale> coronedSupportedLocales = <Locale>[
    Locale('fr', 'FR'),
    Locale('en', 'EN'),
  ];
}
