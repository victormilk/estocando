interface class ApiClient {
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    throw UnimplementedError();
  }

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    throw UnimplementedError();
  }

  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    throw UnimplementedError();
  }

  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    throw UnimplementedError();
  }

  Future<dynamic> patch(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    throw UnimplementedError();
  }
}
