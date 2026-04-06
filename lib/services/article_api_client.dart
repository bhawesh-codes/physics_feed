import 'package:dio/dio.dart';
import 'package:physics_feed/models/category_model.dart';
import 'package:physics_feed/models/filter_article_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:physics_feed/models/article_model.dart';
import 'package:physics_feed/models/article_detail_model.dart';

part 'article_api_client.g.dart';

@RestApi()
abstract class ArticleApiClient {
  factory ArticleApiClient(Dio dio, {String? baseUrl}) = _ArticleApiClient;

  @GET('article')
  Future<ArticleModel> getArticles(@Query('page') int page);

  @GET('article/{slug}')
  Future<ArticleDetailModel> getArticleDetail(@Path('slug') String slug);

  @GET('category')
  Future<List<CategoryModel>> getCategories();

  @GET('category/{slug}')
  Future<FilterArticleModel> getFilterArticles(
    @Path('slug') String slug,
    @Query('page') int page,
  );
}
