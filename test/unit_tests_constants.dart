import 'dart:convert' show jsonEncode;
import 'package:flutter/material.dart' show Key;
import 'package:flutter_test/flutter_test.dart' show Future, find;
import 'package:http/http.dart' show Response;
import 'package:http/testing.dart' show MockClient;
import 'package:cesi_covid_19_tracker/data/models/models.dart' show Country;

final searchBarWidgetFinder = find.byKey(Key('select_country_text_field'));
final countryFlagWidgetFinder = find.bySemanticsLabel('Unknown flag');
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
final testCountry = Country('test', 'test', 'test', 1);
final okCountryClient = MockClient((request) async {
  return Response('[${jsonEncode(testCountry)}]', 200);
});
final testCountries = [
  Country('test', 'test', 'test', 1),
  Country('test2', 'test2', 'test2', 1),
];
final okCountriesClient = MockClient((request) async {
  return Response(
      '[${jsonEncode(testCountries[0])},${jsonEncode(testCountries[1])}]', 200);
});
