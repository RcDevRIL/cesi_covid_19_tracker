import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_modular/flutter_modular.dart' show Modular;

import 'package:cesi_covid_19_tracker/shared/shared.dart'
    show
        AppBarTooltipsTextDelegate,
        AppConstants,
        AppTheme,
        TextTranslationsDelegate;

class CoronedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CORONED',
      theme: AppTheme.defaultAppTheme,
      initialRoute: '/dashboard',
      onGenerateRoute: Modular.generateRoute,
      navigatorKey: Modular.navigatorKey,
      supportedLocales: AppConstants.coronedSupportedLocales,
      locale: AppConstants.coronedSupportedLocales.first,
      localizationsDelegates: [
        // Custom localisation to remove automatic tooltips on Material [AppBar] buttons
        const AppBarTooltipsTextDelegate(),
        // Custom localisation to handle text translations
        const TextTranslationsDelegate(),
        // Built-in delegate for the localisation of the Material widgets (e.g. tooltips).
        GlobalMaterialLocalizations.delegate,
        // Built-in localisation for text direction (left-to-right or right-to-left).
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (final supportedLocale in supportedLocales) {
          // The language of the device of the user is compared to every supported language.
          // If the language codes match, the supported locale with that language code is chosen.
          // This allows users using American English or British English as locales
          // to be able to use the Belgian English localisation.
          if (locale.languageCode == supportedLocale.languageCode) {
            return supportedLocale;
          }
        }
        // If the language of the user isn't supported, the default locale should be used.
        return supportedLocales.first;
      },
    );
  }
}
