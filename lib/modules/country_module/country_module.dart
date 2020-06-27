import 'package:flutter_modular/flutter_modular.dart';

import 'country_bloc.dart';
import 'country_pages.dart';

class CountryModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((_) => CountryBloc())];

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
