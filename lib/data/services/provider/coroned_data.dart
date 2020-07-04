import 'dart:convert' show jsonDecode;
import 'package:cesi_covid_19_tracker/shared/text_translations_delegate.dart';
import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show ApiService, locator;
import 'package:cesi_covid_19_tracker/data/models/country.dart' show Country;
import 'package:cesi_covid_19_tracker/shared/constants/app_globals.dart' as aG;

class CoronedData with ChangeNotifier {
  List<Country> _filteredCountries;
  List<Country> _countryList;
  Country _selectedCountry;
  String _appLanguageCode;
  TextTranslations _appTextTranslations;

  CoronedData() {
    init();
  }

  void init() async {
    _countryList = [];
    _appLanguageCode = 'FR';
    _appTextTranslations =
        await TextTranslations.load(aG.AppConstants.coronedSupportedLocales[0]);
    String apiResponse = await locator.get<ApiService>().getCountries();
    for (var e in jsonDecode(apiResponse)) {
      addIfAbsent(Country.fromJson(e));
    }
    _sortCountryList();
    notifyListeners();
  }

  void addIfAbsent(Country countryToAdd) {
    bool absent = true;
    for (Country c in _countryList) {
      if (c == countryToAdd) absent = false;
    }
    if (absent) _countryList.add(countryToAdd);
  }

  void _sortCountryList() {
    _countryList.sort((c1, c2) => (c1
                    .translations[_appLanguageCode.toLowerCase()] !=
                null &&
            c2.translations[_appLanguageCode.toLowerCase()] != null)
        ? c1.translations[_appLanguageCode.toLowerCase()]
            .compareTo(c2.translations[_appLanguageCode.toLowerCase()])
        : c1.name.compareTo(c2
            .name)); // Fallback comparator, hopefully API will always have a name for an entry
  }

  void filter(String filter) {
    _filteredCountries = _countryList
        .where((e) => e.translations[_appLanguageCode.toLowerCase()] != null
            ? e.translations[_appLanguageCode.toLowerCase()]
                .toLowerCase()
                .contains(filter.toLowerCase())
            : e.name.toLowerCase().contains(filter
                .toLowerCase())) // Fallback filter, hopefully API will always have a name for an entry
        .toList();
    _filteredCountries.sort((c1, c2) => (c1
                    .translations[_appLanguageCode.toLowerCase()] !=
                null &&
            c2.translations[_appLanguageCode.toLowerCase()] != null)
        ? c1.translations[_appLanguageCode.toLowerCase()]
            .compareTo(c2.translations[_appLanguageCode.toLowerCase()])
        : c1.name.compareTo(c2
            .name)); // Fallback comparator, hopefully API will always have a name for an entry
    notifyListeners();
  }

  void resetFilter() => _filteredCountries = null;

  String get appLanguageCode => _appLanguageCode;

  void setAppLanguageCode(String countryCode) {
    _appLanguageCode = countryCode;
    notifyListeners();
  }

  TextTranslations get appTextTranslations => _appTextTranslations;

  void setAppTextTranslations(TextTranslations textTranslations) {
    _appTextTranslations = textTranslations;
    notifyListeners();
  }

  List<Country> get getFilteredCountries => _filteredCountries ?? _countryList;

  List<Country> get getCountryList => _countryList;

  Country get getSelectedCountry => _selectedCountry;

  void setSelectedCountry(Country c) {
    _selectedCountry = c;
    notifyListeners();
  }
}
