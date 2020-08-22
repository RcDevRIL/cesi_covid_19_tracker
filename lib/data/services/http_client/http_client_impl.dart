import 'dart:async';

import 'package:http/http.dart' show Client, Response;

import 'package:cesi_covid_19_tracker/data/services/exceptions/exceptions.dart'
    show APIException, APIUnreachedException;

import 'http_client.dart';

class HttpClientImpl implements HttpClient {
  final int timeOut = 10;
  final Client http = Client();

  @override
  Future<Response> get(String url, {Map<String, String> headers}) async {
    Response response;
    try {
      response = await http
          .get(
            url,
            headers: headers,
          )
          .timeout(Duration(seconds: timeOut));
    } catch (e) {
      if (e.runtimeType == TimeoutException)
        throw APIUnreachedException(
            'Data source is not available. Please try again later.');
      else
        throw APIException('Error when executing GET request:\n$e');
    }
    return response;
  }
}
