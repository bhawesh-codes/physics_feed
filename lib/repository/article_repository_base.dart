import 'package:physics_feed/models/article_detail_model.dart';
import 'package:physics_feed/models/article_model.dart';
import 'package:physics_feed/models/author_model.dart';
import 'package:physics_feed/models/category_model.dart';
import 'package:physics_feed/models/filter_article_model.dart';
import 'package:physics_feed/models/tag_filter_model.dart';
import 'package:physics_feed/models/tag_model.dart';

abstract class ArticleRepositoryBase {
  Future<ArticleModel> fetchArticles();
  Future<ArticleDetailModel> fetchArticleDetail(String slug);
  Future<List<CategoryModel>> fetchCategories();
  Future<FilterArticleModel> fetchFilterArticle(String slug);
  Future<List<TagModel>> fetchTags();
  Future<List<AuthorModel>> fetchAuthor();
  Future<TagFilterModel> fetchTagFilter(String slug);
}
