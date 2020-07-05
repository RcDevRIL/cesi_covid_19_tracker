import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart' show ModularApp;

import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show setupLocator;

import 'modules/modules.dart';

void main() {
  setupLocator();
  runApp(ModularApp(module: CoronedMainModule()));
}
