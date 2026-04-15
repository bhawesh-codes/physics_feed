import 'package:physics_feed/core/error/error_handler.dart';
import 'package:physics_feed/models/article_model.dart';
import 'package:physics_feed/models/article_detail_model.dart';
import 'package:physics_feed/models/author_model.dart';
import 'package:physics_feed/models/category_model.dart';
import 'package:physics_feed/models/filter_article_model.dart';
import 'package:physics_feed/models/tag_filter_model.dart';
import 'package:physics_feed/models/tag_model.dart';
import 'package:physics_feed/repository/article_repository_base.dart';
import 'package:physics_feed/services/article_api_client.dart';



class ArticleRepository implements ArticleRepositoryBase {
  final ArticleApiClient _apiService;

  ArticleRepository(this._apiService);
    // : _apiService = apiService ?? ApiService();

  @override
  Future<ArticleModel> fetchArticles(int page) async {
    try {
      return await _apiService.getArticles(page);
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
  Future<FilterArticleModel> fetchFilterArticle(String slug, int page) async {
    try {
      return await _apiService.getFilterArticles(slug, page);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
  
  @override
  Future<List<TagModel>> fetchTags() async {
    try {
      return await _apiService.getTags();
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
  
  @override
  Future<List<AuthorModel>> fetchAuthor()async {
    try{
      return await _apiService.getAuthor();
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
  
  @override
  Future<TagFilterModel> fetchTagFilter(String slug, int page) async{
    try{
      return await _apiService.getTagFilter(slug, page);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
