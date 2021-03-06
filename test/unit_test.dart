import 'package:flutter_test/flutter_test.dart';

import 'package:get_it/get_it.dart';

import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show ApiService, ApiServiceImpl, AppUtils, AppUtilsImpl;
import 'package:cesi_covid_19_tracker/data/services/exceptions/exceptions.dart'
    show CovidNotFoundException, APIUnreachedException;
import 'package:cesi_covid_19_tracker/modules/blocs.dart' show CoronedData;

import 'mockers/mockers.dart' show HttpClientMock;
import 'unit_tests_constants.dart'
    show
        koClient,
        notFoundClient,
        okCountriesClient,
        baseMockClient,
        slowOkClient,
        testCountry,
        testCountry2;

void main() {
  group('API calls unit tests:', () {
    HttpClientMock baseMock;
    ApiService apiService;
    setUpAll(() {
      // Create an instance of HttpClientMock
      baseMock = HttpClientMock();
      // Create an instance of ApiService using HttpClientMock implementation as http
      apiService = ApiServiceImpl(http: baseMock);
    });
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
      // Expect that the service will hit timeout and throws an APIUnreachedException
      expect(apiService.getWorldLatestSituation(),
          throwsA(isInstanceOf<APIUnreachedException>()));
      expect(apiService.getDataFromCountry('FR'),
          throwsA(isInstanceOf<APIUnreachedException>()));
      expect(apiService.getCountries(),
          throwsA(isInstanceOf<APIUnreachedException>()));
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
    AppUtils appUtils;
    setUpAll(() {
      // Create an instance of our AppUtils
      appUtils = AppUtilsImpl();
    });
    test('formatLargeNumber test', () async {
      // Expect that the method return something different than plain ${number.toString()} if number >= 1000
      assert(appUtils.formatLargeNumber(1000) != 1000.toString());
      // Expect that the method return plain ${number.toString()} otherwise
      assert(appUtils.formatLargeNumber(900) == 900.toString());
      assert(appUtils.formatLargeNumber(-1000) == (-1000).toString());
    });
    test('computeWeights test', () async {
      int testTotal = 10;
      int testActive = 5;
      int testDeaths = 3;
      int testRecovered = 2;
      var testCandidate = appUtils.computeWeights(
          testTotal, testDeaths, testRecovered, testActive);
      // Expect that the method return an object of length 4
      assert(testCandidate.length == 4);
      // Expect that the method return an object with field 'total' equal to 10
      assert(testCandidate['total'] == testTotal);
      // Expect that the method return an object with field 'weightContaminated' equal to 5/10
      assert(testCandidate['weightContaminated'] == testActive / testTotal);
      // Expect that the method return an object with field 'weightDeaths' equal to 3/10
      assert(testCandidate['weightDeath'] == testDeaths / testTotal);
      // Expect that the method return an object with field 'weightRecovered' equal to 2/10
      assert(testCandidate['weightRecovered'] == testRecovered / testTotal);
      // Expect that the method will throw if one of int args is negative
      try {
        appUtils.computeWeights(-1, 0, 3, 0);
      } catch (e) {
        assert(e == 'Invalid value');
      }
    });
  });
  group('CoronedData unit tests', () {
    /// [GetIt] instance, declared as global variable so we can use it in all tests of this group
    GetIt locator;
    CoronedData coronedData;
    setUpAll(() {
      locator = GetIt.instance;
      locator.registerLazySingleton<AppUtils>(() => AppUtilsImpl());
      locator.registerLazySingleton<ApiService>(
          () => ApiServiceImpl(http: HttpClientMock()..http = baseMockClient));
      locator.allowReassignment = true;
    });
    test('init test', () async {
      // Init coronedData
      coronedData = CoronedData();
      // Initialization is async so countrylist is first empty and global infos is null
      assert(coronedData.getCountryList.length == 0);
      assert(coronedData.getGlobalInfos == null);
      // Wait for init method to finish
      await Future.delayed(Duration(seconds: 1));
      // CoronedData.globalInfos, CoronedData.countryList and CoronedData.appTextTranslations sould be filled now
      assert(coronedData.getCountryList.length == 1);
      assert(coronedData.appTextTranslations != null);
      assert(coronedData.getGlobalInfos != null);
    });
    test('addIfAbsent test', () async {
      // Init coronedData
      coronedData = CoronedData();
      // Wait for init method to finish
      await Future.delayed(Duration(seconds: 1));
      final notAbsentCountry = testCountry;
      // Make sure CoronedData is indeed initialized
      assert(coronedData.getCountryList.length == 1);
      coronedData.addIfAbsent(notAbsentCountry);
      // Length should not have changed
      assert(coronedData.getCountryList.length == 1);
      final absentCountry = testCountry2;
      coronedData.addIfAbsent(absentCountry);
      // absentCountry should have been added to CoronedData.countryList
      assert(coronedData.getCountryList.length == 2);
    });
    test('filter test', () async {
      locator.registerLazySingleton<ApiService>(() =>
          ApiServiceImpl(http: HttpClientMock()..http = okCountriesClient));
      // Init coronedData
      coronedData = CoronedData();
      // Wait for init method to finish
      await Future.delayed(Duration(seconds: 1));
      assert(coronedData.getCountryList.length == 11);
      // Filter with input = 'test'
      coronedData.filter('test');
      // All countries names begin with 'test' so filterCountries.length == countryList.length
      assert(coronedData.getFilteredCountries.length ==
          coronedData.getCountryList.length);
      // Filter with input = 'test2'
      coronedData.filter('test2');
      // Only one country should remain in CoronedData.filteredCountries
      assert(coronedData.getFilteredCountries.length == 1);
      // Filter with input = 'test2'
      coronedData.filter('test1');
      // Two countries should remain in CoronedData.filteredCountries (test10 and test1)
      assert(coronedData.getFilteredCountries.length == 2);
      // Reset coronedData.filteredCountries
      coronedData.resetFilter();
      // CoronedData.filteredCountries should be equal to CoronedData.countryList
      assert(coronedData.getFilteredCountries == coronedData.getCountryList);
    });
  });
}
