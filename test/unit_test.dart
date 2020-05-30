import 'package:flutter/material.dart'
    show MaterialApp, MediaQuery, MediaQueryData, Widget;
import 'package:flutter_test/flutter_test.dart'
    show completion, expect, group, isInstanceOf, test, throwsA;
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show ApiService;
import 'package:cesi_covid_19_tracker/data/services/exceptions/exceptions.dart'
    show CovidNotFoundException;
import 'mockers/mockers.dart' show ApiServiceMock;
import 'unit_tests_constants.dart' show koClient, notFoundClient, slowOkClient;

void main() {
  /*import 'package:cesi_covid_19_tracker/ui/pages/country_view.dart'; 
  group('Widgets unit tests:', () {
    testWidgets('Search bar test', (tester) async {
      //TODO
      final testWidget = buildTestableWidget(CountryView());
      await tester.pumpWidget(testWidget);
    });
  }); */
  group('API calls unit tests:', () {
    test('getWorldLatestSituation', () async {
      // Create an instance of ApiService using ApiServiceMock implementation
      ApiService apiService = ApiServiceMock();
      // Expect that the service return a OK response without any error
      expect(apiService.getWorldLatestSituation(), completion(''));
      // Replace the timeout value of our ApiService instance and the http Client
      int newTimeOut = 1;
      apiService = ApiServiceMock()
        ..http = slowOkClient
        ..timeOut = newTimeOut;
      // Expect that the service will hit timeout and throws an error with msg 'Error when trying to connect to API:\n${e.toString()}'
      expect(
          apiService.getWorldLatestSituation(),
          throwsA(
              'Error when trying to connect to API:\nTimeoutException after 0:00:0$newTimeOut.000000: Future not completed'));
      // Replace the http MockClient with one that return a 400 http error code
      apiService = ApiServiceMock()..http = koClient;
      // Expect that the service will throw an error with msg 'Error when trying to connect to API...(HTTP Code: ${response.statusCode})'
      expect(apiService.getWorldLatestSituation(),
          throwsA('Error when trying to connect to API...(HTTP Code: 400)'));
    });
    test('getDataFromCountry', () async {
      // Create an instance of ApiService using ApiServiceMock implementation
      ApiService apiService = ApiServiceMock();
      // Expect that the service return a OK response without any error
      expect(apiService.getDataFromCountry('FR'), completion(''));
      // Replace the timeout value of our ApiService instance and the http Client
      int newTimeOut = 1;
      apiService = ApiServiceMock()
        ..http = slowOkClient
        ..timeOut = newTimeOut;
      // Expect that the service will hit timeout and throws an error with msg 'Error when trying to connect to API:\n${e.toString()}'
      expect(
          apiService.getDataFromCountry('FR'),
          throwsA(
              'Error when trying to connect to API:\nTimeoutException after 0:00:0$newTimeOut.000000: Future not completed'));
      // Replace the http MockClient with one that return a 404 Not Found http error code
      apiService = ApiServiceMock()..http = notFoundClient;
      // Expect that the service will throw a CovidNotFoundException
      expect(apiService.getDataFromCountry('FR'),
          throwsA(isInstanceOf<CovidNotFoundException>()));
      // Replace the http MockClient with one that return a 400 http error code
      apiService = ApiServiceMock()..http = koClient;
      // Expect that the service will throw an error with msg 'Error when trying to connect to API...(HTTP Code: ${response.statusCode})'
      expect(apiService.getDataFromCountry('FR'),
          throwsA('Error when trying to connect to API...(HTTP Code: 400)'));
    });
    test('getCountries', () async {
      // Create an instance of ApiService using ApiServiceMock implementation
      ApiService apiService = ApiServiceMock();
      // Expect that the service return a OK response without any error
      expect(apiService.getCountries(), completion(''));
      // Replace the timeout value of our ApiService instance and the http Client
      int newTimeOut = 1;
      apiService = ApiServiceMock()
        ..http = slowOkClient
        ..timeOut = newTimeOut;
      // Expect that the service will hit timeout and throws an error with msg 'Error when trying to connect to API:\n${e.toString()}'
      expect(
          apiService.getCountries(),
          throwsA(
              'Error when trying to connect to API:\nTimeoutException after 0:00:0$newTimeOut.000000: Future not completed'));
      // Replace the http MockClient with one that return a 400 http error code
      apiService = ApiServiceMock()..http = koClient;
      // Expect that the service will throw an error with msg 'Error when trying to connect to API...(HTTP Code: ${response.statusCode})'
      expect(apiService.getDataFromCountry('FR'),
          throwsA('Error when trying to connect to API...(HTTP Code: 400)'));
    });
  });
  /* group('App Utils unit tests:', () {
    // Create an instance of our AppUtils service used to call API
    AppUtils appUtils;
    test('first test', () async {
      //TODO
    });
  }); */
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
