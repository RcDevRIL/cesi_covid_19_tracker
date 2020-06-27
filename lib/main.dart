import 'package:cesi_covid_19_tracker/modules/modules.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show CoronedData, setupLocator;
import 'package:cesi_covid_19_tracker/ui/pages/pages.dart'
    show CovidFaq, Dashboard;
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;

void main() {
  setupLocator();
  runApp(ModularApp(module: CoronedMainModule()));
}

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

class CoronedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CORONED',
      localizationsDelegates: [
        const AppBarTooltipsText(),
      ],
      theme: aG.AppTheme.defaultAppTheme,
      initialRoute: '/dashboard',
      onGenerateRoute: Modular.generateRoute,
      navigatorKey: Modular.navigatorKey,
    );
  }
}

/// TEMPORARY
/// workaround to override tooltips on auto generated menu button and back button
/// found on (https://medium.com/@caleb_52205/flutter-removing-appbar-tooltips-app-wide-from-materialapp-constructor-54781606266f)
class AppBarTooltipsTextOverride extends DefaultMaterialLocalizations {
  AppBarTooltipsTextOverride(Locale locale) : super();
  @override
  String get backButtonTooltip => null;
  @override
  String get openAppDrawerTooltip => null;
}

class AppBarTooltipsText extends LocalizationsDelegate<MaterialLocalizations> {
  const AppBarTooltipsText();
  @override
  Future<AppBarTooltipsTextOverride> load(Locale locale) {
    return SynchronousFuture(AppBarTooltipsTextOverride(locale));
  }

  @override
  bool shouldReload(AppBarTooltipsText old) => false;
  @override
  bool isSupported(Locale locale) => true;
}
