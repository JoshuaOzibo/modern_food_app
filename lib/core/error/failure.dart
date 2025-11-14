class Failure {
  final String message;

  Failure({this.message = 'An unexpected error occured'});
}

class ServerFailure extends Failure {
  ServerFailure({super.message = 'Server error occured'});
}

class NetworkError extends Failure {
  NetworkError({super.message = 'Network error occured'});
}
