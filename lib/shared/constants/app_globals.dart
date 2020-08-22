import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:cesi_covid_19_tracker/shared/shared.dart' show SizeBreakpoint;

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
    textTheme: GoogleFonts.poppinsTextTheme(
      TextTheme(
        headline1: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: Colors.white70,
        ),
        headline4: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        headline5: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        bodyText1: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.black,
          fontSize: 18.0,
        ),
        bodyText2: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.black,
        ),
        caption: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
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
  static const String applicationVersion = '1.8.0+9';
  static const String applicationIcon = 'assets/img/virus-logo.png';
  static const String cesiDijonUrl = 'https://dijon.cesi.fr/';
  static const String repositoryUrl =
      'https://www.github.com/RcDevRIL/cesi_covid_19_tracker';
  static const List<Locale> coronedSupportedLocales = <Locale>[
    Locale('fr', 'FR'),
    Locale('en', 'EN'),
  ];
  static const int maxScrollToTopDuration = 2000;
  static const int scrollToTopTreshold = 300;
  static OverlayEntry buildScrollToTopButton(VoidCallback onPressed) =>
      OverlayEntry(
        builder: (context) => Positioned(
          key: Key('scroll_to_top_button'),
          bottom: !(context.isMobile || context.isWatch) ? 24.0 : 8.0,
          right: !(context.isMobile || context.isWatch) ? 24.0 : 8.0,
          child: Material(
            type: MaterialType.button,
            elevation: 0.0,
            shadowColor: Colors.grey[800],
            color: Theme.of(context).primaryColor.withOpacity(0.75),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
                side: BorderSide(
                  color: Colors.black87,
                )),
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.keyboard_arrow_up,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      );
}
