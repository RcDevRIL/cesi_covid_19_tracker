import 'dart:convert' show jsonDecode;
import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show ApiService, locator;
import 'package:cesi_covid_19_tracker/data/models/country.dart' show Country;

class CoronedData with ChangeNotifier {
  List<Country> _filteredCountries;
  List<Country> _countryList;
  Country _selectedCountry;

  CoronedData() {
    init();
  }

  void init() async {
    _countryList = [];
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
    _countryList.sort((c1, c2) => (c1.translations['fr'] != null &&
            c2.translations['fr'] != null)
        ? c1.translations['fr'].compareTo(c2.translations['fr'])
        : c1.name.compareTo(c2
            .name)); // Fallback comparator, hopefully API will always have a name for an entry
  }

  void filter(String filter) {
    _filteredCountries = _countryList
        .where((e) => e.translations['fr'] != null
            ? e.translations['fr'].toLowerCase().contains(filter.toLowerCase())
            : e.name.toLowerCase().contains(filter
                .toLowerCase())) // Fallback filter, hopefully API will always have a name for an entry
        .toList();
    _filteredCountries.sort((c1, c2) => (c1.translations['fr'] != null &&
            c2.translations['fr'] != null)
        ? c1.translations['fr'].compareTo(c2.translations['fr'])
        : c1.name.compareTo(c2
            .name)); // Fallback comparator, hopefully API will always have a name for an entry
    notifyListeners();
  }

  void resetFilter() => _filteredCountries = null;

  List<Country> get getFilteredCountries => _filteredCountries ?? _countryList;

  List<Country> get getCountryList => _countryList;

  Country get getSelectedCountry => _selectedCountry;

  void setSelectedCountry(Country c) {
    _selectedCountry = c;
    notifyListeners();
  }
}
