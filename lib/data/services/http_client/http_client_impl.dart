import 'package:http/http.dart' show Client, Response;

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
      throw 'Error when executing GET request:\n$e';
    }
    return response;
  }
}
