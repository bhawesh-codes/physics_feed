import 'package:flutter/material.dart';
import 'package:physics_feed/core/utils/app_router.dart';
import 'package:physics_feed/core/utils/service_locator.dart';
import 'package:physics_feed/models/tag_filter_model.dart';
import 'package:physics_feed/repository/article_repository.dart';
import 'package:physics_feed/views/article_details/article_detail_view.dart';

class TagFilterViewmodel extends ChangeNotifier {
  final ArticleRepository _repository = sl<ArticleRepository>();

  TagFilterViewmodel();
  // : _repository = repository ?? ArticleRepository();
  bool isLoading = false;
  TagFilterModel? _tagFilterArticle ;
  TagFilterModel? get tagFilterArticle => _tagFilterArticle;

  String? error;
  Future<void> fetchTags(String slug) async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      _tagFilterArticle = await _repository.fetchTagFilter(slug);
      error = null;
    } catch (e) {
      _tagFilterArticle = null;
      error = 'Failed to load tags: $e';
    }
    isLoading = false;
    notifyListeners();
  }
  void navigateToDetail({required String slug}) {
    AppRouter.navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (_) => ArticleDetailView(slug: slug)),
    );
  }

}
