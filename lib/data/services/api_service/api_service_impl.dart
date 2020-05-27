import 'api_service.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:cesi_covid_19_tracker/data/services/exceptions/exceptions.dart'
    show CovidNotFoundException;

class ApiServiceImpl implements ApiService {
  final String covidBaseUrl = 'https://corona.lmao.ninja/v2/';
  final int timeOut = 10;
  Client http = Client();

  @override
  Future<String> getDataFromCountry(String countryCode) async {
    Response response;
    try {
      response = await http.get(
        covidBaseUrl + 'countries/$countryCode',
        headers: {'Content-type': 'application/json'},
      ).timeout(Duration(seconds: timeOut));
    } catch (e) {
      throw 'Error when trying to connect to API:\n${e.toString()}';
    }
    switch (response?.statusCode) {
      case 200:
        return response.body;
        break;
      case 404:
        throw CovidNotFoundException('Response Headers: ${response.headers}\r\n'
            'Response Status: ${response.statusCode}\r\n'
            'Response Content : (size=${response.contentLength})\r\n${response.body}\r\n\r\n'
            'This response was triggered by following request:\r\n${response.request}');
        break;
      default:
        throw 'Error when trying to connect to API...(HTTP Code: ${response.statusCode})';
        break;
    }
  }

  @override
  Future<String> getWorldLatestSituation() async {
    Response response;
    try {
      response = await http.get(
        covidBaseUrl + 'all',
        headers: {'Content-type': 'application/json'},
      ).timeout(Duration(seconds: timeOut));
    } catch (e) {
      throw 'Error when trying to connect to API:\n${e.toString()}';
    }
    if (response?.statusCode == 200) {
      return response.body;
    } else {
      throw 'Error when trying to connect to API...(HTTP Code: ${response.statusCode})';
    }
  }

  final String countriesBaseUrl = 'https://restcountries.eu/rest/v2';

  @override
  Future<String> getCountries() async {
    Response response;
    try {
      response = await http
          .get('$countriesBaseUrl/all?fields=name;alpha2Code;population;flag')
          .timeout(Duration(seconds: timeOut));
    } catch (e) {
      throw 'Error when trying to connect to API:\n${e.toString()}';
    }
    if (response?.statusCode == 200) {
      return response.body;
    } else {
      throw 'Error when trying to connect to API...(HTTP Code: ${response.statusCode})';
    }
  }
}
