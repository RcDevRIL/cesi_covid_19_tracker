import 'package:cesi_covid_19_tracker/ui/pages/pages.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CountryModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => Router.group(
        transition: TransitionType.noTransition,
        routes: [
          Router(
            Modular.initialRoute,
            child: (context, args) => CountryView(),
          ),
          Router(
            '/:countryCode',
            child: (context, args) => DetailsPage(
              countryCode: args.params['countryCode'],
            ),
          ),
        ],
      );

  static Inject get to => Inject<CountryModule>.of();
}
