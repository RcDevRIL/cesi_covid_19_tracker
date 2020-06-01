import 'package:http/http.dart' show Response;

abstract class HttpClient {
  Future<Response> get(
    String url, {
    Map<String, String> headers,
  });
}
