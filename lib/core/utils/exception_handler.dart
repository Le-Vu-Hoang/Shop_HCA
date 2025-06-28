import 'package:dio/dio.dart';
import 'package:e_commercial/core/errors/failure.dart';

Failure handleDioException(DioException e, {String ? contextMessage}) {
  if (e.type == DioExceptionType.connectionError ||
      e.type == DioExceptionType.connectionTimeout) {
    return NetworkFailure(contextMessage ?? 'No internet connection');
  }

  switch (e.response?.statusCode) {
    case 401:
      return AuthFailure(contextMessage ?? 'Unauthorized access');
    case 403:
      return AuthFailure(contextMessage ?? 'Forbidden access');
    case 404:
      return AuthFailure(contextMessage ?? 'Resource not found');
    case 500:
      return ServerFailure(contextMessage ?? 'Internal server error');
    default:
      return ServerFailure(
        e.response?.data['message'] ?? contextMessage ?? 'Unexpected server error',
      );
  }
}