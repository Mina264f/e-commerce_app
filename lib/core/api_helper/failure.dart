import 'package:dio/dio.dart';

class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.serverError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection Timeout');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive Timeout');

      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send Timeout');

      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'Bad Certificate');

      case DioExceptionType.badResponse:
        return ServerFailure(errMessage: 'Bad Response');

      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Request Canceled');

      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: 'Connection Error');

      case DioExceptionType.unknown:
        return ServerFailure(errMessage: 'Unknown Error');
    }
  }

  factory ServerFailure.fromCode(int? code, dynamic response) {
    switch (code) {
      case 400:
      case 403:
        return ServerFailure(errMessage: '${response['message']}');
      case 401:
        return ServerFailure(errMessage: '${response['message']}');
      case 404:
        return ServerFailure(errMessage: 'Not Found');
      case 409:
        return ServerFailure(errMessage: 'Conflict');
      case 408:
        return ServerFailure(errMessage: 'Request Timeout');
      case 500:
        return ServerFailure(errMessage: 'Internal Server Error');
      default:
        return ServerFailure(errMessage: 'Something went wrong');
    }
  }
}

class ApiException implements Exception {
  final Failure failure;
  ApiException({required this.failure});
}
