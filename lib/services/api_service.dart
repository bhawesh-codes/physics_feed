import 'package:dio/dio.dart';
import 'package:physics_feed/models/article_detail_model.dart';
import 'package:physics_feed/models/article_model.dart';
import 'package:physics_feed/services/dio_client.dart';

class ApiService {
  // int page = 1;
  final Dio _dioClient = DioClient().dio;

  Future<ArticleModel> getArticle() async {
    try {
      final response = await _dioClient.get('article?page=1');
      return ArticleModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load article: $e');
    }
  }

  Future<ArticleDetailModel> getArticleDetail(String slug) async {
    try {
      final response = await _dioClient.get("article/$slug");
      return ArticleDetailModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load Details: $e');
    }
  }
}
