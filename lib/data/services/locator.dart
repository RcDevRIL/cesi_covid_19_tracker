import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart' show GetIt;
import 'package:http/http.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<AppUtils>(() => AppUtilsImplementation());
}

abstract class AppUtils {
  Future<String> getWorldLatestSituation();
  Future<String> getDataFromCountry(String countryCode);
}

class AppUtilsImplementation implements AppUtils {
  final String baseUrl = 'https://coronavirus-tracker-api.herokuapp.com/v2/';
  final Client http = new Client();
  final int timeOut = 10;

  @override
  Future<String> getDataFromCountry(String countryCode) async {
    var response;
    try {
      response = await http.get(
        baseUrl + 'locations?country_code=$countryCode',
        headers: {'Content-type': 'application/json'},
      ).timeout(Duration(seconds: timeOut));
    } catch (e) {
      debugPrint('Error when trying to connect to API:\n' + e.toString());
      return null;
    }
    if (response?.statusCode == 200) {
      debugPrint('${response.body}');
      return response.body;
    } else if (response?.statusCode == 401) {
      return 'Unauthorized!';
    } else {
      debugPrint('Error when trying to connect to API...');
      return null;
    }
  }

  @override
  Future<String> getWorldLatestSituation() async {
    var response;
    try {
      response = await http.get(
        baseUrl + 'latest',
        headers: {'Content-type': 'application/json'},
      ).timeout(Duration(seconds: timeOut));
    } catch (e) {
      debugPrint('Error when trying to connect to API:\n' + e.toString());
      return null;
    }
    if (response?.statusCode == 200) {
      debugPrint('${response.body}');
      return response.body;
    } else if (response?.statusCode == 401) {
      return 'Unauthorized!';
    } else {
      debugPrint('Error when trying to connect to API...');
      return null;
    }
  }
}
