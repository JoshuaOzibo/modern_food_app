import 'package:dio/dio.dart';
import '../../../network/app_client.dart';

class FetchProductRepository {
  Future<Map<String, dynamic>?> fetchTopRatedFood() async {
    try {
      final response = await AppClient().getTopRatedFoodRequest(
        'search.php?f=c',
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

  Future<Map<String, dynamic>?> fetchPopularCategory() async {
    try {
      final response = await AppClient().getTopRatedFoodRequest(
        'search.php?f=h',
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

  Future<Map<String, dynamic>?> fetchAllTopRatedFood() async {
    try {
      final response = await AppClient().getTopRatedFoodRequest(
        'search.php?f=e',
      );
      if (response != null && response.data['meals'] != null) {
        print('repository response ${response.data}');
        return response.data;
      } else {
        print('No data found for allTopRated food');
        print(response?.data);
      }
    } on DioException catch (e) {
      print('DioException error: ${e.message}');
    } catch (e) {
      print('Unexpected error: $e');
    }

    return null;
  }

  Future<Map<String, dynamic>?> fetchAllPopularCategoty() async{
    try{
      final response = await AppClient().getTopRatedFoodRequest(
        'search.php?f=g',
      );
      if (response != null && response.data['meals'] != null) {
        print('repository response ${response.data}');
        return response.data;
      } else {
        print('No data found for all popular category');
        print(response?.data);
      }
    }on DioException catch (e) {
      print('DioException error: ${e.message}');
    } catch (e) {
      print('Unexpected error: $e');
    }

    return null;
  }
}
