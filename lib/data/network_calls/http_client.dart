import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:rest_api_demo/data/endpoints/endpoints.dart';
import 'package:rest_api_demo/data/network_calls/logging_interceptor.dart';

class HttpClient
{
  final InterceptedClient _client = InterceptedClient.build(interceptors: [
    LoggingInterceptor()
  ]);

  Future<Response> makePostCall({
    required String apiName,
    required dynamic data
  }) async
  {
    Response response = await _client.post(Uri.parse(EndPoints.baseUrl+apiName),
    body: data);
    return response;
  }

  
}