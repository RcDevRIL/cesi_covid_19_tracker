import 'package:flutter_test/flutter_test.dart' show Future, find;
import 'package:flutter/material.dart' show TextField;
import 'package:http/http.dart' show Response;
import 'package:http/testing.dart' show MockClient;

final searchBarWidgetFinder = find.byType(TextField);
final koClient = MockClient((request) async {
  return Response('', 400);
});
final unauthorizedClient = MockClient((request) async {
  return Response('', 401);
});
final notFoundClient = MockClient((request) async {
  return Response('', 404);
});
final slowOkClient = MockClient((request) async {
  await Future.delayed(Duration(seconds: 3));
  return Response('', 200);
});
