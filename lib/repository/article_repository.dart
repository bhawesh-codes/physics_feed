import 'package:physics_feed/core/error/error_handler.dart';
import 'package:physics_feed/models/article_model.dart';
import 'package:physics_feed/models/article_detail_model.dart';
import 'package:physics_feed/models/author_model.dart';
import 'package:physics_feed/models/category_model.dart';
import 'package:physics_feed/models/filter_article_model.dart';
import 'package:physics_feed/models/tag_filter_model.dart';
import 'package:physics_feed/models/tag_model.dart';
import 'package:physics_feed/services/article_api_client.dart';

abstract class ArticleRepositoryBase {
  Future<ArticleModel> fetchArticles();
  Future<ArticleDetailModel> fetchArticleDetail(String slug);
  Future<List<CategoryModel>> fetchCategories();
  Future<FilterArticleModel> fetchFilterArticle(String slug); 
  Future<List<TagModel>> fetchTags(); 
  Future<List<AuthorModel>> fetchAuthor();
  Future<TagFilterModel> fetchTagFilter(String slug);
}

class ArticleRepository implements ArticleRepositoryBase {
  final ArticleApiClient _apiService;

  ArticleRepository(this._apiService);
    // : _apiService = apiService ?? ApiService();

  @override
  Future<ArticleModel> fetchArticles() async {
    try {
      return await _apiService.getArticles(1);
    } catch (e) {
      throw ErrorHandler.handle(e); // re-wraps if something slipped through
    }
  }

  @override
  Future<ArticleDetailModel> fetchArticleDetail(String slug) async {
    try {
      return await _apiService.getArticleDetail(slug);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
  @override
  Future<List<CategoryModel>> fetchCategories() async {
    try {
      return await _apiService.getCategories();
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
}

  @override
  Future<FilterArticleModel> fetchFilterArticle(String slug) {
    try {
      return _apiService.getFilterArticles(slug, 1);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
  
  @override
  Future<List<TagModel>> fetchTags() {
    try {
      return _apiService.getTags();
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
  
  @override
  Future<List<AuthorModel>> fetchAuthor() {
    try{
      return _apiService.getAuthor();
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
  
  @override
  Future<TagFilterModel> fetchTagFilter(String slug) {
    try{
      return _apiService.getTagFilter(slug, 1);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
