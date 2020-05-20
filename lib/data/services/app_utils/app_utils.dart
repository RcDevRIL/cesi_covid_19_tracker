abstract class AppUtils {
  Future<String> getWorldLatestSituation();
  Future<String> getDataFromCountry(String countryCode);
  String formatLargeNumber(int number);
  Future<List<String>> getCountryList();
}
