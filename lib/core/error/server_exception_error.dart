import 'package:modern_food_app/core/error/failure.dart';

class ServerExceptionError extends Failure {
  final int? statusCode;

  ServerExceptionError({super.message = 'Server error occured', this.statusCode});
}
