import 'dart:convert';
import 'package:cesi_covid_19_tracker/data/services/services.dart';
import 'package:flutter/material.dart';
import 'package:cesi_covid_19_tracker/data/models/country.dart';

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
      this.addIfAbsent(Country.fromJson(e));
    }
    notifyListeners();
  }

  void addIfAbsent(Country countryToAdd) {
    bool absent = true;
    for (Country c in _countryList) {
      if (c == countryToAdd) absent = false;
  }
    if (absent) _countryList.add(countryToAdd);
  }

  void filter(String filter) {
    _filteredCountries = _countryList
        .where((e) => e.name.toLowerCase().contains(filter.toLowerCase()))
        .toList();
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
