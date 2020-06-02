import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show ApiService, ApiServiceImpl, AppUtils, AppUtilsImpl, CoronedData;
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'mockers/mockers.dart' show HttpClientMock;
import 'package:cesi_covid_19_tracker/ui/pages/country_view.dart';

import 'unit_tests_constants.dart';

/// [GetIt] instance, declared as global variable so we can use it in other methods than main
GetIt locator;
void main() {
  CoronedData coronedData;
  setUpAll(() {
    locator = GetIt.instance;
    setupLocator();
    // Create an instance of CoronedData
    coronedData = CoronedData();
  });
  group('Widgets unit tests:', () {
    testWidgets('CountryView test', (tester) async {
      // Build a CountryView with previously initiated CoronedData Provider class
      final testWidget = buildTestableApp(CountryView(), coronedData);
      await tester.pumpWidget(testWidget);
      // Expect no error and find the following two widgets
      expect(searchBarWidgetFinder, findsOneWidget);
      expect(countryFlagWidgetFinder, findsOneWidget);
      // Replace HttpClientMock instance with one that
      //   gives a list of 2 countries
      locator.registerLazySingleton<ApiService>(() =>
          ApiServiceImpl(http: HttpClientMock()..http = okCountriesClient));
      // Trigger a call to the mock http client
      coronedData.init();
      // expect provider magic to happen !
      //     --> only trigger a frame and you have now two cards because
      //         two countries in the list
      await tester.pump();
      expect(countryFlagWidgetFinder, findsNWidgets(2));
      // Filter country list with the name given on the 2nd test country
      await tester.enterText(searchBarWidgetFinder, 'test2');
      await tester.pump();
      // expect that CoronedData.filteredCountries.length == 1 now so only 1 card displayed
      expect(countryFlagWidgetFinder, findsOneWidget);
    });
  });
}

/// Wrap the page we want to unit test with necessary [MediaQueryData] (default one here),
///  needed [Providers], and default [MaterialApp]
Widget buildTestableApp(Widget widget, CoronedData coronedData) {
  return MediaQuery(
    data: MediaQueryData(),
    child: ChangeNotifierProvider(
      create: (_) => coronedData,
      child: MaterialApp(
        home: widget,
        initialRoute: '/',
      ),
    ),
  );
}

/// Register the singletons used in test (can be real implementation or mocks)
void setupLocator() {
  locator.registerLazySingleton<AppUtils>(() => AppUtilsImpl());
  locator.registerLazySingleton<ApiService>(
      () => ApiServiceImpl(http: HttpClientMock()..http = okCountryClient));
  locator.allowReassignment = true;
}
