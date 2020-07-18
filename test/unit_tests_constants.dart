import 'dart:convert' show jsonEncode;
import 'package:flutter/material.dart'
    show CircularProgressIndicator, Image, Key;
import 'package:flutter_test/flutter_test.dart' show Future, find;

import 'package:http/http.dart' show Response;
import 'package:http/testing.dart' show MockClient;

import 'package:cesi_covid_19_tracker/shared/shared.dart'
    show CoronedCard, GlobalCard;
import 'package:cesi_covid_19_tracker/data/models/models.dart'
    show Country, CovidCountryInfos, CovidInfos;

final imageFinder = find.byType(Image);
final scrollToTopButtonFinder = find.byKey(Key('scroll_to_top_button'));
final searchBarWidgetFinder = find.byKey(Key('select_country_text_field'));
final countryCardWidgetFinder = find.byType(CoronedCard);
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
final testCountry2 = Country({'fr': 'test1'}, 'test1', 'test1', 'FR', 1);
final baseMockClient = MockClient((request) async {
  switch (request.url.host) {
    case 'restcountries.eu':
      return Response('[${jsonEncode(testCountry)}]', 200);
      break;
    case 'disease.sh':
      print(request.url.pathSegments.last);
      return request.url.pathSegments.last.compareTo('all') == 0
          ? Response(jsonEncode(testGlobalStats.toJson()), 200)
          : Response(jsonEncode(testCountryStats.toJson()), 200);
      break;
    default:
      return Response('well..nope!', 400);
  }
});
String _buildTestCountriesJsonString() {
  List<Country> testCountries = [testCountry];
  for (int i = 1; i < 11; i++) {
    testCountries.add(Country({'fr': 'test$i'}, 'test$i', 'test$i', 'FR', 1));
  }
  String result = '[';
  for (Country c in testCountries) {
    testCountries.indexOf(c) != testCountries.length - 1
        ? result += '${jsonEncode(c)},'
        : result += jsonEncode(c);
  }
  return result += ']';
}

final okCountriesClient = MockClient((request) async {
  return Response(_buildTestCountriesJsonString(), 200);
});
final testGlobalStats = CovidInfos(
  1591205254910,
  6513890,
  72608,
  384642,
  2783,
  3100971,
  3028277,
  54283,
  836,
  49.3,
  48.0,
  88791112,
  11453.22,
  215000,
  6.2,
  2.2,
  645.8,
  152,
);
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
  65,
  6565,
  "Europe",
  32,
  32,
  32,
);
final okCountryStatsClient = MockClient((request) async {
  print(request.url.host);
  print(request.url.path);
  print(request.url.queryParameters);
  print(request.url.pathSegments);
  print(request.url.pathSegments.last);
  return Response(jsonEncode(testCountryStats.toJson()), 200);
});
