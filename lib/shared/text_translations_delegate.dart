import 'package:cesi_covid_19_tracker/l10n/messages_all.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextTranslations {
  static TextTranslations currentTranslation;

  TextTranslations._(Locale locale) {
    currentTranslation = this;
  }

  static Future<TextTranslations> load(Locale locale) {
    final String name = locale.countryCode == null || locale.countryCode.isEmpty
        ? locale.languageCode
        : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return TextTranslations._(locale);
    });
  }

  // Localizations are usually accessed using the InheritedWidget "of" syntax.
  static TextTranslations of(BuildContext context) {
    return Localizations.of<TextTranslations>(context, TextTranslations);
  }

  /// The getters that make translations possibles and are wired to arb files.
  /// Each time these getters are modified need to run following command:
  ///     - flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n lib/shared/text_translations_delegate.dart assets/arbs/intl_messages_fr-FR.arb assets/arbs/intl_messages_en-US.arb --no-use-deferred-loading
  String get globalStats =>
      Intl.message('Statistiques Mondiales', name: 'globalStats');
}

class TextTranslationsDelegate extends LocalizationsDelegate<TextTranslations> {
  // As the instance of this delegate will never change, it can have a const constructor.
  const TextTranslationsDelegate();

  // Checks whether or not a certain locale (or language code in this cast) is supported.
  // The order of the locales doesn't matter in this case.
  @override
  bool isSupported(Locale locale) => ['en', 'fr'].contains(locale.languageCode);

  // Load the translations of a certain locale.
  @override
  Future<TextTranslations> load(Locale locale) => TextTranslations.load(locale);

  // Defines whether or not all the app’s widgets should be reloaded when the load method is completed.
  @override
  bool shouldReload(LocalizationsDelegate<TextTranslations> old) => false;
}
