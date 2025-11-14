import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:modern_food_app/core/error/network_exception.dart';
import 'package:modern_food_app/core/error/server_exception_error.dart';

class AppClient {
  static String baseUrl = '${dotenv.env['API_BASE_URL']}';
  final Dio _dio = Dio()..interceptors.add(CustomInterceptors());

  Future<Response?> getTopRatedFoodRequest(String endpoint) async {
    try {
      final response = await _dio.get('$baseUrl/$endpoint');
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerExceptionError(
          message: e.response?.data?.toString() ?? 'Server error',
          statusCode: e.response?.statusCode ?? 500,
        );
      } else {
        throw NetworkException(message: e.message ?? 'Network Error');
      }
    }
  }

  Future<Response?> getPopularCategory(String endpoint) async {
    // try {
    //   final response = await _dio.get('$baseUrl/$endpoint');
    //   return response;
    // } on DioException catch (e) {
    //   if (e.response != null) {
    //     print("Server error with status code: ${e.response?.statusCode}");
    //     print("Response data: ${e.response?.data}");
    //   } else {
    //     print("Network error: ${e.message}");
    //   }

    //   return null;
    // }
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
