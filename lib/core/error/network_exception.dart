import 'package:modern_food_app/core/error/failure.dart';

class NetworkException extends Failure {
  NetworkException({super.message = 'Network error occured'});
}