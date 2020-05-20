abstract class AppUtils {
  Future<String> getWorldLatestSituation();
  Future<String> getDataFromCountry(String countryCode);
  Future<Map<String, dynamic>> getAllCountriesData();
  String formatLargeNumber(int number);
  Future<List<String>> getCountryList();
}
