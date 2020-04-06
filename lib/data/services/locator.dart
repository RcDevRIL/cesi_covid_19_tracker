import 'package:get_it/get_it.dart' show GetIt;

import 'services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<AppUtils>(() => AppUtilsImplementation());
}
