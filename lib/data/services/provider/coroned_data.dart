import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CoronedData with ChangeNotifier {
  List<String> _csvList;
  List<String> _filteredCountries;

  CoronedData() {
    init();
  }

  List<String> get getCountryList => _csvList;

  List<String> get getFilteredCountries => _filteredCountries ?? _csvList;

  void init() {
    _csvList = [];
    loadCsvAsList();
  }

  void loadCsvAsList() async {
    print('loading csv...');
    String csvData = await rootBundle.loadString('assets/data/data_csv.txt');
    for (String line in csvData.split('\r\n')) {
      if (line.isNotEmpty && !line.contains('Name,Code')) {
        _csvList.add(line);
      }
    }
    print('csv loaded!');
    notifyListeners();
  }
}
