import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart'
    show Bind, Inject, MainModule, ModularRouter, TransitionType;

import 'package:cesi_covid_19_tracker/shared/shared.dart' show AppConstants;
import 'package:cesi_covid_19_tracker/modules/modules.dart' show CountryModule;

import 'main_pages.dart';
import 'main_blocs.dart';
import 'main_widget.dart';

class CoronedMainModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((_) => CoronedData()),
      ];

  @override
  List<ModularRouter> get routers => ModularRouter.group(
        transition: TransitionType.noTransition,
        routes: [
          ModularRouter(
            '/dashboard',
            child: (context, args) => Dashboard(),
          ),
          ModularRouter(
            '/country',
            module: CountryModule(),
            modulePath: '/country',
          ),
          ModularRouter(
            '/faq',
            child: (context, args) => CovidFaq(),
          ),
          ModularRouter(
            '/about',
            child: (context, args) => AboutPage(
              applicationName: AppConstants.applicationName,
              applicationVersion: AppConstants.applicationVersion,
              applicationIcon: Image.asset(
                AppConstants.applicationIcon,
                height: 50.0,
                width: 50.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      );

  @override
  Widget get bootstrap => CoronedWidget();

  static Inject get to => Inject<CoronedMainModule>.of();
}
