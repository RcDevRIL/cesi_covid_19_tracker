import 'dart:convert' show jsonEncode;
import 'package:flutter/material.dart' show CircularProgressIndicator, Key;
import 'package:flutter_test/flutter_test.dart' show Future, find;

import 'package:http/http.dart' show Response;
import 'package:http/testing.dart' show MockClient;

import 'package:cesi_covid_19_tracker/shared/shared.dart' show GlobalCard;
import 'package:cesi_covid_19_tracker/data/models/models.dart'
    show Country, CovidCountryInfos, CovidInfos;

final searchBarWidgetFinder = find.byKey(Key('select_country_text_field'));
final countryFlagWidgetFinder = find.bySemanticsLabel('Unknown flag');
final globalCardWidgetFinder = find.byType(GlobalCard);
final circularProgressWidgetFinder = find.byType(CircularProgressIndicator);
final koClient = MockClient((request) async {
  return Response('', 400);
});
final unauthorizedClient = MockClient((request) async {
  return Response('', 401);
});
final notFoundClient = MockClient((request) async {
  return Response('', 404);
});
final slowOkClient = MockClient((request) async {
  await Future.delayed(Duration(seconds: 3));
  return Response('', 200);
});
final testCountry = Country({'fr': 'test'}, 'test', 'test', 'FR', 1);
final okCountryClient = MockClient((request) async {
  return Response('[${jsonEncode(testCountry)}]', 200);
});
final testCountries = [
  testCountry,
  Country({'fr': 'test2'}, 'test2', 'test2', 'FR', 1),
];
final okCountriesClient = MockClient((request) async {
  return Response(
      '[${jsonEncode(testCountries[0])},${jsonEncode(testCountries[1])}]', 200);
});
final testGlobalStats = CovidInfos(1591205254910, 6513890, 72608, 384642, 2783,
    3100971, 3028277, 54283, 836, 49.3, 88791112, 11453.22, 215);
final okGlobalStatsClient = MockClient((request) async {
  return Response(jsonEncode(testGlobalStats.toJson()), 200);
});
final testCountryStats = CovidCountryInfos(
  'France',
  {
    "_id": 250,
    "iso2": "FR",
    "iso3": "FRA",
    "lat": 46,
    "long": 2,
    "flag": "https://disease.sh/assets/img/flags/fr.png"
  },
  1591219057413,
  151677,
  352,
  29021,
  81,
  69455,
  53201,
  1210,
  2324,
  445,
  1384633,
  21216,
);
final okCountryStatsClient = MockClient((request) async {
  return Response(jsonEncode(testCountryStats.toJson()), 200);
});
