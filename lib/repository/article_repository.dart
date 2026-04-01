import 'package:physics_feed/models/article_model.dart';
import 'package:physics_feed/models/article_detail_model.dart';
import 'package:physics_feed/services/api_service.dart';

// Contract — defines what any ArticleRepository must be able to do
abstract class ArticleRepositoryBase {
  Future<ArticleModel> fetchArticles();
  Future<ArticleDetailModel> fetchArticleDetail(String slug);
}

// Real implementation
class ArticleRepository implements ArticleRepositoryBase {
  final ApiService _apiService;

  ArticleRepository({ApiService? apiService})
    : _apiService = apiService ?? ApiService();

  @override
  Future<ArticleModel> fetchArticles() async {
    try {
      return await _apiService.getArticle();
    } catch (e) {
      throw Exception('Failed to fetch articles: $e');
    }
  }

  @override
  Future<ArticleDetailModel> fetchArticleDetail(String slug) async {
    try {
      return await _apiService.getArticleDetail(slug);
    } catch (e) {
      throw Exception('Failed to fetch article detail: $e');
    }
  }
}
