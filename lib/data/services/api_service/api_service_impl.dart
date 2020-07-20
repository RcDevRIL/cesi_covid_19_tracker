import 'package:http/http.dart' show Response;

import 'package:cesi_covid_19_tracker/data/services/exceptions/exceptions.dart'
    show CovidNotFoundException;
import 'package:cesi_covid_19_tracker/data/services/http_client/http_client.dart'
    show HttpClient;

import 'api_service.dart';

class ApiServiceImpl implements ApiService {
  final String covidBaseUrl = 'https://disease.sh/v3/covid-19/';
  final HttpClient http;

  ApiServiceImpl({this.http});

  @override
  Future<String> getDataFromCountry(String countryCode) async {
    Response response = await http.get(
      covidBaseUrl + 'countries/$countryCode',
      headers: {'Content-type': 'application/json'},
    );
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
    Response response = await http.get(
      covidBaseUrl + 'all',
      headers: {'Content-type': 'application/json'},
    );
    if (response?.statusCode == 200) {
      return response.body;
    } else {
      throw 'Error when trying to connect to API...(HTTP Code: ${response.statusCode})';
    }
  }

  final String countriesBaseUrl = 'https://restcountries.eu/rest/v2';

  @override
  Future<String> getCountries() async {
    Response response = await http.get(
        '$countriesBaseUrl/all?fields=name;alpha2Code;population;flag;translations');
    if (response?.statusCode == 200) {
      return response.body;
    } else {
      throw 'Error when trying to connect to API...(HTTP Code: ${response.statusCode})';
    }
  }
}
