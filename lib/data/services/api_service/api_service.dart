abstract class ApiService {
  Future<String> getWorldLatestSituation();
  Future<String> getDataFromCountry(String countryCode);
  Future<String> getCountries();
}
