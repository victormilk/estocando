import 'package:dio/dio.dart';
import 'package:estocando_flutter/src/shared/clients/api_client.dart';

class DioClient implements ApiClient {
  final Dio _dio;

  const DioClient(this._dio);

  @override
  Future delete(String path, {Map<String, dynamic>? queryParameters}) async {
    return _dio.delete(path, queryParameters: queryParameters);
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    final response = await _dio.get(path, queryParameters: queryParameters);
    return response.data;
  }

  @override
  Future patch(String path,
      {Map<String, dynamic>? queryParameters, body}) async {
    throw UnimplementedError();
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? queryParameters, body}) async {
    return _dio.post(path, queryParameters: queryParameters, data: body);
  }

  @override
  Future put(String path, {Map<String, dynamic>? queryParameters, body}) async {
    return _dio.put(path, queryParameters: queryParameters, data: body);
  }
}
