import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cesi_covid_19_tracker/ui/pages/dashboard.dart';

void main() {
  final dropdownWidgetFinder = find.byKey(Key('Country List'));
  testWidgets('DashBoard dummy test', (WidgetTester tester) async {
    final testWidget = buildTestableWidget(DashBoard());
    // Build our app and trigger a frame.
    await tester.pumpWidget(testWidget);
    expect(dropdownWidgetFinder, findsOneWidget);
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
