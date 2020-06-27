import 'package:cesi_covid_19_tracker/modules/country_module/country_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart'
    show ListTile, MaterialApp, MediaQuery, MediaQueryData, Widget;
import 'package:get_it/get_it.dart' show GetIt;
import 'package:provider/provider.dart' show ChangeNotifierProvider;
import 'package:cesi_covid_19_tracker/shared/widgets/widgets.dart'
    show CountryCard;
import 'package:cesi_covid_19_tracker/modules/pages.dart'
    show CountryView, CovidFaq, Dashboard, DetailsPage;
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show ApiService, ApiServiceImpl, AppUtils, AppUtilsImpl, CoronedData;
import 'mockers/mockers.dart' show HttpClientMock;
import 'unit_tests_constants.dart'
    show
        circularProgressWidgetFinder,
        countryFlagWidgetFinder,
        globalCardWidgetFinder,
        okCountriesClient,
        okCountryClient,
        okCountryStatsClient,
        okGlobalStatsClient,
        searchBarWidgetFinder;

/// [GetIt] instance, declared as global variable so we can use it in other methods than main
GetIt locator;
void main() {
  CoronedData coronedData;
  setUpAll(() {
    locator = GetIt.instance;
    setupLocator();
    // Create an instance of CoronedData
    coronedData = CoronedData();
    initModule(CountryModule(),
        changeBinds: [Bind((_) => coronedData, singleton: false)]);
  });
  group('Widgets unit tests:', () {
    testWidgets('CountryView test', (tester) async {
      // Build a CountryView with previously initiated CoronedData Provider class
      final testWidget = buildTestableApp(CountryView());
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
      // provider's magic
      await tester.pump();
      // expect that CoronedData.filteredCountries.length == 1 now so only 1 card displayed
      expect(countryFlagWidgetFinder, findsOneWidget);
    });
    testWidgets('DashBoard test', (tester) async {
      // Replace HttpClientMock instance with one that gives mocked world stats
      locator.registerLazySingleton<ApiService>(() =>
          ApiServiceImpl(http: HttpClientMock()..http = okGlobalStatsClient));
      // Build a DashBoard
      final testWidget = buildTestableApp(Dashboard());
      await tester.pumpWidget(testWidget);
      // Expect the UI to show a CircularProgressIndicator and the card yet
      expect(globalCardWidgetFinder, findsNothing);
      expect(circularProgressWidgetFinder, findsOneWidget);
      // Trigger a frame so mocked infos are loaded
      await tester.pump();
      // Expect that there is now a GlobalCard displayed
      expect(globalCardWidgetFinder, findsOneWidget);
    });
    testWidgets('FAQ test', (tester) async {
      // Build a FAQ
      final testWidget = buildTestableApp(CovidFaq());
      await tester.pumpWidget(testWidget);
      // Expect to find several ListTiles displaying questions and associated answers about COVID-19
      expect(find.byType(ListTile), findsWidgets);
    });

    testWidgets('Details test', (tester) async {
      // Replace HttpClientMock instance with one that gives mocked country stats
      locator.registerLazySingleton<ApiService>(() =>
          ApiServiceImpl(http: HttpClientMock()..http = okCountryStatsClient));
      // Build a DetailsPage
      final testWidget = buildTestableApp(DetailsPage(countryCode: 'FR'));
      await tester.pumpWidget(testWidget);
      // Expect the UI to show a CircularProgressIndicator and not the card yet
      expect(find.byType(CountryCard), findsNothing);
      expect(circularProgressWidgetFinder, findsOneWidget);
      // Trigger a frame so mocked infos are loaded
      await tester.pump();
      // Expect that there is now a CountryCard displayed
      expect(find.byType(CountryCard), findsOneWidget);
    });
  });
}

/// Wrap the page we want to unit test with necessary [MediaQueryData] (default one here)
/// and default [MaterialApp]
Widget buildTestableApp(Widget widget) {
  return MediaQuery(
    data: MediaQueryData(),
    child: MaterialApp(
      home: widget,
      initialRoute: Modular.initialRoute,
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
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
