import 'package:flutter_modular/flutter_modular.dart';

import 'country_pages.dart';

class CountryModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => ModularRouter.group(
        transition: TransitionType.noTransition,
        routes: [
          ModularRouter(
            Modular.initialRoute,
            child: (context, args) => CountryView(),
          ),
          ModularRouter(
            '/:countryCode',
            child: (context, args) => DetailsPage(
              countryCode: args.params['countryCode'],
            ),
          ),
        ],
      );

  static Inject get to => Inject<CountryModule>.of();
}
