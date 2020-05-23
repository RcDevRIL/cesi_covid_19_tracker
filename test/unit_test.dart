import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cesi_covid_19_tracker/data/services/services.dart';

import 'unit_tests_constants.dart';

void main() {
  group('Widgets unit tests', () {
    //TODO
  });
  group('API calls unit tests', () {
    test('getWorldLatestSituation API test', () async {
      // Create an instance of our AppUtils service used to call API and replace the http Client with a MockClient from http test package
      ApiService apiService = ApiServiceImpl()..http = okCovidInfosClient;
      // Expect that the service return a JSON
      expect(apiService.getWorldLatestSituation(), completion(dummyCovidInfos));
      // Replace the http MockClient with one that return a 400 Not Found http error code
      apiService = ApiServiceImpl()..http = koClient;
      // Expect that the service will throw an error with msg 'Error when trying to connect to API...'
      expect(apiService.getWorldLatestSituation(),
          throwsA('Error when trying to connect to API...(HTTP Code: 400)'));
    });
    test('getDataFromCountry API test', () async {
      // Create an instance of our AppUtils service used to call API and replace the http Client with a MockClient from http test package
      ApiService apiService = ApiServiceImpl()
        ..http = okCovidCountryInfosClient;
      // Expect that the service return a JSON
      expect(apiService.getDataFromCountry('FR'),
          completion(dummyCovidCountryInfos));
      // Replace the http MockClient with one that return a 400 Not Found http error code
      apiService = ApiServiceImpl()..http = koClient;
      // Expect that the service will throw an error with msg 'Error when trying to connect to API...'
      expect(apiService.getDataFromCountry('FR'),
          throwsA('Error when trying to connect to API...(HTTP Code: 400)'));
    });
  });
}

Widget buildTestableWidget(Widget widget) {
  return MediaQuery(
    data: MediaQueryData(),
    child: MaterialApp(
      home: widget,
      initialRoute: '/',
    ),
  );
}
