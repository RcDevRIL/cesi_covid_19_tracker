import 'package:get_it/get_it.dart' show GetIt;
import 'services.dart' show AppUtils, AppUtilsImpl, ApiService, ApiServiceImpl;

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<AppUtils>(() => AppUtilsImpl());
  locator.registerLazySingleton<ApiService>(() => ApiServiceImpl());
}
