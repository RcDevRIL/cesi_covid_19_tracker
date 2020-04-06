import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Coroned App', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Initialize App', () async {
      final homePage = find.byType('Dashboard');
      final coronedCard = find.byValueKey('dashboard-card');

      await driver.waitFor(homePage);
      await Future.delayed(Duration(seconds: 2));

      assert(homePage != null);
    });

    test('Change Page', () async {
      final burgerMenu = find.byTooltip('Open navigation menu');
      final countryViewTile = find.text('COUNTRIES');
      final countryView = find.byType('CountryView');

      await driver.tap(burgerMenu);
      await Future.delayed(Duration(seconds: 2));
      await driver.tap(countryViewTile);

      await Future.delayed(Duration(seconds: 2));

      assert(countryView != null);
    });
  });
}
