import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: 'Connection timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Send timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'Receive timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: 'Bad certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!);
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: 'Request cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: 'Connection error');
      case DioExceptionType.unknown:
        return ServerFailure(errorMessage: 'Unknown error');
    }
  }

  factory ServerFailure.fromResponse(Response response) {
    switch (response.statusCode) {
      case 400:
        return ServerFailure(errorMessage: 'Bad request');
      case 401:
        return ServerFailure(errorMessage: 'Unauthorized');
      case 403:
        return ServerFailure(errorMessage: 'Forbidden');
      case 404:
        return ServerFailure(errorMessage: 'Not found , please try later');
      case 500:
        return ServerFailure(
            errorMessage: 'Internal server error , please try later');
      case 503:
        return ServerFailure(
            errorMessage: 'Service unavailable , please try later');
      default:
        return ServerFailure(errorMessage: 'Unknown error , please try later');
    }
  }
}
