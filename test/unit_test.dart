import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:cesi_covid_19_tracker/data/models/models.dart' show CovidInfos;
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show ApiService, ApiServiceImpl, AppUtils, AppUtilsImpl;
import 'package:cesi_covid_19_tracker/data/services/exceptions/exceptions.dart'
    show CovidNotFoundException;
import 'mockers/mockers.dart' show HttpClientMock;
import 'unit_tests_constants.dart'
    show koClient, notFoundClient, slowOkClient, testGlobalStats;

void main() {
  HttpClientMock baseMock;
  ApiService apiService;
  AppUtils appUtils;
  setUpAll(() {
    // Create an instance of HttpClientMock
    baseMock = HttpClientMock();
    // Create an instance of ApiService using HttpClientMock implementation as http
    apiService = ApiServiceImpl(http: baseMock);
    // Create an instance of our AppUtils using HttpClientMock implementation as http
    appUtils = AppUtilsImpl();
  });
  group('other random tests:', () {
    test('json test', () async {
      assert(testGlobalStats ==
          CovidInfos.fromJson(jsonDecode('{'
              '"updated": 1591205254910,'
              '"cases": 6513890,'
              '"todayCases": 72608,'
              '"deaths": 384642,'
              '"todayDeaths": 2783,'
              '"recovered": 3100971,'
              '"active": 3028277,'
              '"critical": 54283,'
              '"casesPerOneMillion": 836,'
              '"deathsPerOneMillion": 49.3,'
              '"tests": 88791112,'
              '"testsPerOneMillion": 11453.22,'
              '"affectedCountries": 215'
              '}')));
    });
  });
  group('API calls unit tests:', () {
    test('OK test', () async {
      // Expect that the service return a OK response without any error
      expect(apiService.getWorldLatestSituation(), completion(''));
      expect(apiService.getDataFromCountry('FR'), completion(''));
      expect(apiService.getCountries(), completion(''));
    });
    test('Timeout test', () async {
      // Replace the timeout value of the http Client for our ApiService
      int newTimeOut = 1;
      apiService = ApiServiceImpl(
          http: baseMock
            ..http = slowOkClient
            ..timeOut = newTimeOut);
      // Expect that the service will hit timeout and throws an error with msg 'Error when executing GET request:\n${e.toString()}'
      expect(
          apiService.getWorldLatestSituation(),
          throwsA(
              'Error when executing GET request:\nTimeoutException after 0:00:0$newTimeOut.000000: Future not completed'));
      expect(
          apiService.getDataFromCountry('FR'),
          throwsA(
              'Error when executing GET request:\nTimeoutException after 0:00:0$newTimeOut.000000: Future not completed'));
      expect(
          apiService.getCountries(),
          throwsA(
              'Error when executing GET request:\nTimeoutException after 0:00:0$newTimeOut.000000: Future not completed'));
    });
    test('404 test', () async {
      // Replace the http MockClient with one that return a 404 Not Found http error code
      apiService = ApiServiceImpl(http: baseMock..http = notFoundClient);
      // Expect that the service will throw a CovidNotFoundException
      expect(apiService.getDataFromCountry('FR'),
          throwsA(isInstanceOf<CovidNotFoundException>()));
    });
    test('KO test', () async {
      // Replace the http MockClient with one that return a 400 http error code
      apiService = ApiServiceImpl(http: baseMock..http = koClient);
      // Expect that the service will throw an error with msg 'Error when trying to connect to API...(HTTP Code: ${response.statusCode})'
      expect(apiService.getWorldLatestSituation(),
          throwsA('Error when trying to connect to API...(HTTP Code: 400)'));
      expect(apiService.getDataFromCountry('FR'),
          throwsA('Error when trying to connect to API...(HTTP Code: 400)'));
      expect(apiService.getDataFromCountry('FR'),
          throwsA('Error when trying to connect to API...(HTTP Code: 400)'));
    });
  });
  group('App Utils unit tests:', () {
    test('formatLargeNumber test', () async {
      // Expect that the method return something different than plain ${number.toString()} if number >= 1000
      expect(appUtils.formatLargeNumber(1000), isNot(1000.toString()));
      // Expect that the method return plain ${number.toString()} otherwise
      expect(appUtils.formatLargeNumber(900), 900.toString());
      expect(appUtils.formatLargeNumber(-1000), (-1000).toString());
    });
    test('computeWeights test', () async {
      var testCandidate = appUtils.computeWeights(1, 1, 1);
      // Expect that the method return an object of length 4
      expectSync(testCandidate, hasLength(4));
      // Expect that the method return an object with field 'total' equal to 3
      assert(testCandidate['total'] == 3);
      // Expect that the method return an object with field 'weightContaminated' equal to 1/3
      assert(testCandidate['weightContaminated'] == 1 / 3);
      // Expect that the method return an object with field 'weightDeaths' equal to 1/3
      assert(testCandidate['weightDeath'] == 1 / 3);
      // Expect that the method return an object with field 'weightRecovered' equal to 1/3
      assert(testCandidate['weightRecovered'] == 1 / 3);
      // Expect that the method will throw if one of int args is negative
      try {
        appUtils.computeWeights(-1, 0, 3);
      } catch (e) {
        assert(e == 'Invalid value');
      }
    });
  });
}
