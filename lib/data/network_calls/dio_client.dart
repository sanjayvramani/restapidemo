import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rest_api_demo/data/endpoints/endpoints.dart';
import 'package:rest_api_demo/data/network_calls/dio_interceptor.dart';

class DioClient
{
  late Dio _dio;

  DioClient()
  {
    _dio = Dio();
    _dio.interceptors.add(DioInterceptor());
    _dio.options=BaseOptions(
      baseUrl: EndPoints.baseUrl,
      headers: {
        'Accept':'application/json',
        'Content-Type':'application/json'
      }
    );
  }

  Future<Response> makeGetCall({required String apiName,
  Map<String,dynamic>? parameters}) async
  {
    return await _dio.get(apiName,
    queryParameters: parameters);
  }

  Future<Response> makePostCall({required String apiName,
  Map<String,dynamic>? parameters}) async
  {
    var response = await _dio.post(apiName,
    data: jsonEncode(parameters));
    closeHttpConnection();

    return response;
  }

  Future<Response> makePutCall({required String apiName,
  Map<String,dynamic>? parameters}) async
  {
    return await _dio.patch(apiName,
    data: parameters);
  }

    Future<Response> makeDeleteCall({required String apiName,
  Map<String,dynamic>? parameters}) async
  {
    return await _dio.delete(apiName,
    data: parameters);
  }

  closeHttpConnection()
  {
    _dio.httpClientAdapter.close(force: true);
  }
}