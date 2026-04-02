import 'package:dio/dio.dart';
import 'package:physics_feed/core/error/app_exception.dart';

class ErrorHandler {
  static AppException handle(dynamic error) {
    if (error is AppException) return error;
    if (error is DioException) return _handleDio(error);
    return const AppException(message: 'Something went wrong');
  }

  static AppException _handleDio(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionError:
        return const AppException(message: 'No internet connection');
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const AppException(message: 'Request timed out. Try again');
      case DioExceptionType.badResponse:
        return _handleStatusCode(e.response?.statusCode, e.response?.data);
      default:
        return const AppException(message: 'Something went wrong');
    }
  }

  static AppException _handleStatusCode(int? statusCode, dynamic data) {
    final serverMsg = data is Map ? data['message'] ?? data['error'] : null;
    return switch (statusCode) {
      400 => AppException(message: serverMsg ?? 'Invalid request'),
      401 => const AppException(
        message: 'Session expired. Please log in again',
      ),
      403 => const AppException(message: 'You don\'t have permission'),
      404 => const AppException(message: 'Resource not found'),
      422 => AppException(message: serverMsg ?? 'Validation failed'),
      500 => const AppException(message: 'Server error. Try again later'),
      503 => const AppException(
        message: 'Service unavailable. Try again later',
      ),
      _ => AppException(message: serverMsg ?? 'Unexpected error ($statusCode)'),
    };
  }
}
