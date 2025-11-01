import 'package:dio/dio.dart';

class AppClient {
  static const String baseUrl = 'https://www.themealdb.com';

  final Dio _dio = Dio()
    ..interceptors.add(CustomInterceptors()); 

  Future<Response?> getRequest(String endpoint) async {
    try {
      final response = await _dio.get('$baseUrl/$endpoint');
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        print("Server error: ${e.response?.statusCode}");
        print("Response data: ${e.response?.data}");
      } else {
        print("Network error: ${e.message}");
      }
      return null;
    }
  }
}

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('Request[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('Response[${response.statusCode}] => DATA: ${response.data}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('Error[${err.response?.statusCode}] => MESSAGE: ${err.message}');
    return super.onError(err, handler);
  }
}
