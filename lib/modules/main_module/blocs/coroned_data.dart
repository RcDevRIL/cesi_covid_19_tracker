import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/shared/shared.dart'
    show AppConstants, TextTranslations;
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show ApiService, locator;
import 'package:cesi_covid_19_tracker/data/models/models.dart' show Country;

class CoronedData with ChangeNotifier {
  List<Country> _filteredCountries;
  List<Country> _countryList;
  Country _selectedCountry;
  String _appLanguageCode;
  TextTranslations _appTextTranslations;
  OverlayEntry _scrollToTopButton;
  bool _isScrollToTopShown;

  CoronedData() {
    init();
  }

  void init() async {
    _isScrollToTopShown = false;
    _countryList = [];
    _appLanguageCode = 'FR';
    _appTextTranslations =
        await TextTranslations.load(AppConstants.coronedSupportedLocales[0]);
    String apiResponse = await locator.get<ApiService>().getCountries();
    for (var e in jsonDecode(apiResponse)) {
      addIfAbsent(Country.fromJson(e));
    }
    _sortCountryList(_countryList);
    notifyListeners();
  }

  void addIfAbsent(Country countryToAdd) {
    bool absent = true;
    for (Country c in _countryList) {
      if (c == countryToAdd) absent = false;
    }
    if (absent) _countryList.add(countryToAdd);
  }

  void _sortCountryList(List<Country> countryList) {
    countryList.sort((c1, c2) => (c1
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
    _sortCountryList(_filteredCountries);
    notifyListeners();
  }

  void resetFilter() => _filteredCountries = null;

  void removeScrollToTopButton() {
    _scrollToTopButton.remove();
    _isScrollToTopShown = false;
    notifyListeners();
  }

  void showScrollToTopButton(
      BuildContext context, OverlayEntry scrollToTopButton) {
    _scrollToTopButton = scrollToTopButton;
    Overlay.of(context).insert(_scrollToTopButton);
    _isScrollToTopShown = true;
    notifyListeners();
  }

  String get appLanguageCode => _appLanguageCode;

  void setAppLanguageCode(String countryCode) {
    _appLanguageCode = countryCode;
    notifyListeners();
  }

  TextTranslations get appTextTranslations => _appTextTranslations;

  void setAppTextTranslations(TextTranslations textTranslations) {
    _appTextTranslations = textTranslations;
    _sortCountryList(_countryList);
    notifyListeners();
  }

  List<Country> get getFilteredCountries => _filteredCountries ?? _countryList;

  List<Country> get getCountryList => _countryList;

  Country get getSelectedCountry => _selectedCountry;

  void setSelectedCountry(Country c) {
    _selectedCountry = c;
    notifyListeners();
  }

  OverlayEntry get scrollToTopButton => _scrollToTopButton;

  bool get isScrollToTopShown => _isScrollToTopShown;
}
