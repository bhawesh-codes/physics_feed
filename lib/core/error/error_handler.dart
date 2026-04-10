import 'package:dio/dio.dart';
import 'package:physics_feed/models/error_model.dart';

class ErrorHandler {
  static Exception handle(Object e) {
    if (e is DioException) {
      final data = e.response?.data;

      if (data is Map<String, dynamic>) {
        try {
          final error = ErrorModel.fromJson(data);
          return Exception(error.message ?? "Error occurred");
        } catch (_) {
          return Exception("Invalid error format");
        }
      }
    
    }
    return Exception("Something went wrong");
  }
}
