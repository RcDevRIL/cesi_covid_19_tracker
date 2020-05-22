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

  List<Country> get getFilteredCountries => _filteredCountries;

  List<Country> get getCountryList => _countryList;

  Country get getSelectedCountry => _selectedCountry;

  void setSelectedCountry(Country c) {
    _selectedCountry = c;
    notifyListeners();
  }

  void init() async {
    _countryList = [];
    _selectedCountry = null;
    String apiResponse = await locator.get<ApiService>().getCountries();
    for (var e in jsonDecode(apiResponse)) {
      this.addCountry(Country.fromJson(e));
    }
  }

  void addCountry(Country c) {
    _countryList.add(c);
  }

  void filter(String filter) {
    _filteredCountries =
        _countryList.where((e) => e.name.contains(filter)).toList();
    notifyListeners();
  }
}
