import 'package:cesi_covid_19_tracker/data/services/services.dart';
import 'package:cesi_covid_19_tracker/modules/country_module/country_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cesi_covid_19_tracker/shared/constants/app_globals.dart' as aG;

import 'main_pages.dart';
import 'main_widget.dart';

class CoronedMainModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((_) => CoronedData()),
      ];

  @override
  List<Router> get routers => Router.group(
        transition: TransitionType.noTransition,
        routes: [
          Router(
            '/dashboard',
            child: (context, args) => Dashboard(),
          ),
          Router(
            '/country',
            module: CountryModule(),
          ),
          Router(
            '/faq',
            child: (context, args) => CovidFaq(),
          ),
          Router(
            '/about',
            child: (context, args) => LicensePage(
              applicationName: aG.AppConstants.applicationName,
              applicationVersion: aG.AppConstants.applicationVersion,
              applicationIcon: Image.asset(
                aG.AppConstants.applicationIcon,
                height: 50.0,
                width: 50.0,
                fit: BoxFit.contain,
              ),
              applicationLegalese: aG.AppConstants.applicationLegalese,
            ),
          ),
        ],
      );

  @override
  Widget get bootstrap => CoronedWidget();

  static Inject get to => Inject<CoronedMainModule>.of();
}
