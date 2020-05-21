import 'app_utils.dart';

import 'package:http/http.dart' show Client, Response;
import 'package:intl/intl.dart' show NumberFormat;

class AppUtilsImplementation implements AppUtils {
  final String baseUrl = 'https://corona.lmao.ninja/v2/';
  final int timeOut = 10;
  Client http = Client();

  @override
  Future<String> getDataFromCountry(String countryCode) async {
    Response response;
    try {
      response = await http.get(
        baseUrl + 'countries/$countryCode',
        headers: {'Content-type': 'application/json'},
      ).timeout(Duration(seconds: timeOut));
    } catch (e) {
      throw 'Error when trying to connect to API:\n${e.toString()}';
    }
    if (response?.statusCode == 200) {
      print('${response.body}');
      return response.body;
    } else if (response?.statusCode == 401) {
      throw 'Unauthorized!';
    } else {
      throw 'Error when trying to connect to API...(HTTP Code: ${response.statusCode})';
    }
  }

  @override
  Future<String> getWorldLatestSituation() async {
    Response response;
    try {
      response = await http.get(
        baseUrl + 'all',
        headers: {'Content-type': 'application/json'},
      ).timeout(Duration(seconds: timeOut));
    } catch (e) {
      throw 'Error when trying to connect to API:\n${e.toString()}';
    }
    if (response?.statusCode == 200) {
      print('${response.body}');
      return response.body;
    } else if (response?.statusCode == 401) {
      throw 'Unauthorized!';
    } else {
      throw 'Error when trying to connect to API...(HTTP Code: ${response.statusCode})';
    }
  }

  @override
  String formatLargeNumber(int number) => number >= 1000
      ? NumberFormat("###,###,###", 'fr').format(number)
      : number.toString();
}
