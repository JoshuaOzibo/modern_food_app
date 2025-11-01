import 'package:dio/dio.dart';
import '../../../network/app_client.dart';

class FetchProductRepository {
  Future<Map<String, dynamic>?> fetchProduct() async {
    try {
      final response = await AppClient().getRequest(
        'api/json/v1/1/search.php?f=a',
      );
      if (response != null && response.data['meals'] != null) {
        print('repository response ${response.data}');
        return response.data;
      } else {
        print('No data found');
        print(response?.data);
      }
    } on DioException catch (e) {
      print('DioException error: ${e.message}');
    } catch (e) {
      print('Unexpected error: $e');
    }

    return null;
  }
}
