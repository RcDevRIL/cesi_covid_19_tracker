import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cesi_covid_19_tracker/l10n/messages_all.dart';

class TextTranslations {
  static Future<TextTranslations> load(Locale locale) {
    final String name = locale.countryCode == null || locale.countryCode.isEmpty
        ? locale.languageCode
        : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return TextTranslations();
    });
  }

  // Localizations are usually accessed using the InheritedWidget "of" syntax.
  static TextTranslations of(BuildContext context) {
    return Localizations.of<TextTranslations>(context, TextTranslations);
  }

  /// The getters that make translations possibles and are wired to arb files.
  /// Each time these getters are modified need to run following command:
  ///     - flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n lib/shared/text_translations_delegate.dart assets/l10n/arbs/intl_messages_fr-FR.arb assets/l10n/arbs/intl_messages_en-EN.arb --no-use-deferred-loading
  String get globalStats => Intl.message('', name: 'globalStats');
  String get contaminated => Intl.message('', name: 'contaminated');
  String get deaths => Intl.message('', name: 'deaths');
  String get recovered => Intl.message('', name: 'recovered');
  String get about => Intl.message('', name: 'about');
  String get selectCountryDefaultText =>
      Intl.message('', name: 'selectCountryDefaultText');
  String get faqQuestion1 => Intl.message('', name: 'FAQQuestion1');
  String get faqQuestion2 => Intl.message('', name: 'FAQQuestion2');
  String get faqQuestion3 => Intl.message('', name: 'FAQQuestion3');
  String get faqQuestion4 => Intl.message('', name: 'FAQQuestion4');
  String get faqQuestion5 => Intl.message('', name: 'FAQQuestion5');
  String get faqQuestion6 => Intl.message('', name: 'FAQQuestion6');
  String get faqQuestion7 => Intl.message('', name: 'FAQQuestion7');
  String get faqQuestion9 => Intl.message('', name: 'FAQQuestion9');
  String get faqQuestion10 => Intl.message('', name: 'FAQQuestion10');
  String get faqAnswer1 => Intl.message('', name: 'FAQAnswer1');
  String get faqAnswer2 => Intl.message('', name: 'FAQAnswer2');
  String get faqAnswer3 => Intl.message('', name: 'FAQAnswer3');
  String get faqAnswer4 => Intl.message('', name: 'FAQAnswer4');
  String get faqAnswer5 => Intl.message('', name: 'FAQAnswer5');
  String get faqAnswer6 => Intl.message('', name: 'FAQAnswer6');
  String get faqAnswer7 => Intl.message('', name: 'FAQAnswer7');
  String get faqAnswer8 => Intl.message('', name: 'FAQAnswer8');
  String get faqAnswer9 => Intl.message('', name: 'FAQAnswer9');
  String get appDesc1 => Intl.message('', name: 'appDesc1');
  String get appDesc2 => Intl.message('', name: 'appDesc2');
  String get appDesc3 => Intl.message('', name: 'appDesc3');
  String get appDesc4 => Intl.message('', name: 'appDesc4');
  String get appDesc5 => Intl.message('', name: 'appDesc5');
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
