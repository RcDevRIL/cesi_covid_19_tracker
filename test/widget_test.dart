import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart'
    show
        AssetImage,
        BoxFit,
        Image,
        ListTile,
        MaterialApp,
        MediaQuery,
        MediaQueryData,
        Widget;

import 'package:flutter_modular/flutter_modular.dart' show Bind, Modular;
import 'package:flutter_modular/flutter_modular_test.dart' show initModules;
import 'package:get_it/get_it.dart' show GetIt;

import 'package:cesi_covid_19_tracker/shared/shared.dart' show CountryCard;
import 'package:cesi_covid_19_tracker/modules/blocs.dart' show CoronedData;
import 'package:cesi_covid_19_tracker/modules/modules.dart'
    show CoronedMainModule, CountryModule;
import 'package:cesi_covid_19_tracker/modules/pages.dart'
    show AboutPage, CountryView, CovidFaq, Dashboard, DetailsPage;
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show ApiService, ApiServiceImpl, AppUtils, AppUtilsImpl;

import 'mockers/mockers.dart' show HttpClientMock;
import 'unit_tests_constants.dart'
    show
        circularProgressWidgetFinder,
        countryFlagWidgetFinder,
        globalCardWidgetFinder,
        imageFinder,
        okCountriesClient,
        okCountryClient,
        okCountryStatsClient,
        okGlobalStatsClient,
        scrollToTopButtonFinder,
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
    initModules([
      CoronedMainModule(),
      CountryModule(),
    ], changeBinds: [
      Bind((_) => coronedData, singleton: false)
    ]);
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
      //     --> only trigger a frame and you have now some of the countries displayed as cards
      await tester.pump();
      expect(countryFlagWidgetFinder, findsWidgets);
      // Scroll to some value > AppConstants.scrollToTopTreshold
      await tester.drag(countryFlagWidgetFinder.last, Offset(0, -350));
      await tester.pump();
      // The Scroll To Top button should have been added to Overlay.of(context)
      expect(scrollToTopButtonFinder, findsOneWidget);
      // Tap on button to come back on top of the ListView
      await tester.tap(scrollToTopButtonFinder);
      // Here we use pumpAndSettle to make sure scroll animation is over
      await tester.pumpAndSettle();
      // The search bar should be visible
      expect(searchBarWidgetFinder, findsOneWidget);
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
    testWidgets('About test', (tester) async {
      // Build the About page
      final testWidget = buildTestableApp(AboutPage(
        applicationName: 'Widget Tests',
        applicationVersion: 'v0.0.0+0',
        applicationIcon: Image.asset(
          'assets/img/virus-logo.png',
          height: 50.0,
          width: 50.0,
          fit: BoxFit.contain,
        ),
        applicationLegalese: [
          coronedData.appTextTranslations?.appDesc1,
          coronedData.appTextTranslations?.appDesc2,
          coronedData.appTextTranslations?.appDesc3,
          coronedData.appTextTranslations?.appDesc4,
          coronedData.appTextTranslations?.appDesc5,
        ],
      ));
      await tester.pumpWidget(testWidget);
      // Expect to find two Images which should be our app icon and the CESI logo on AppBar
      expect(imageFinder, findsNWidgets(2));
      // Get the images found
      final shownImages = imageFinder.evaluate();
      // First should be our app icon (assets/img/virus-logo.png)
      final Image firstImage = shownImages.first.widget;
      expect(firstImage.image, equals(AssetImage('assets/img/virus-logo.png')));
      // Then the CESI logo in CoronedAppBar (assets/img/cesilogo.png)
      final Image secondImage = shownImages.last.widget;
      expect(secondImage.image, equals(AssetImage('assets/img/cesilogo.png')));
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
