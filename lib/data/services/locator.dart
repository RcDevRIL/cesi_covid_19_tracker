import 'package:get_it/get_it.dart' show GetIt;

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<AppUtils>(() => AppUtilsImplementation());
}

abstract class AppUtils {
  Future<Map<String, Object>> getDataFromCountry(String countryCode);
}

class AppUtilsImplementation implements AppUtils {
  @override
  Future<Map<String, Object>> getDataFromCountry(String countryCode) async {
    //TODO implement http calls to a covid-19 data API
    return null;
  }
}
