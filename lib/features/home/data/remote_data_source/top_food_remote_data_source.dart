import 'package:modern_food_app/core/error/server_exception_error.dart';
import 'package:modern_food_app/models/product_ui_model.dart';
import 'package:modern_food_app/network/app_client.dart';

abstract interface class TopFoodRemoteDataSource {
  Future<Map<String, dynamic>> fetchTopFood({required String url});
}

class TopFoodRemoteDataSourceImpl implements TopFoodRemoteDataSource {
  final AppClient clientFunc;
  TopFoodRemoteDataSourceImpl(this.clientFunc);

  @override
  Future<Map<String, dynamic>> fetchTopFood({required String url}) async {
    try {
      final response = await clientFunc.getTopRatedFoodRequest(url);
      if (response?.data == null) {
        throw ServerExceptionError(message: 'No Data received');
      }

      return response!.data;
    } catch (e) {
      print('Error fetching top food: $e');
      rethrow;
    }
  }
}
