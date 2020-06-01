import 'package:http/http.dart' show Client, Response;
import 'package:http/testing.dart';
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show HttpClient;

class HttpClientMock implements HttpClient {
  int timeOut = 10;
  Client http = MockClient((request) async {
    return Response('', 200);
  });

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
      throw 'Error when executing GET request:\n${e.toString()}';
    }
    return response;
  }
}
