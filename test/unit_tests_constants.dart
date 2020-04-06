import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'package:http/testing.dart';

import 'package:cesi_covid_19_tracker/data/models/covid_country_infos.dart';
import 'package:cesi_covid_19_tracker/data/models/covid_infos.dart';

final dropdownWidgetFinder = find.byKey(Key('Country List'));
final dummyCovidInfos = jsonEncode(
  CovidInfos(123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123),
);
final dummyCovidCountryInfos = jsonEncode(
  CovidCountryInfos('France', {'test': 12}, 123, 123, 123, 123, 123, 123, 123,
      123, 123, 123, 123, 123),
);
final okCovidCountryInfosClient = MockClient((request) async {
  return Response(dummyCovidCountryInfos, 200);
});
final okCovidInfosClient = MockClient((request) async {
  return Response(dummyCovidInfos, 200);
});
final koClient = MockClient((request) async {
  return Response('', 400);
});
final unauthorizedClient = MockClient((request) async {
  return Response('', 401);
});
