import 'package:flutter/material.dart';
import 'package:physics_feed/core/error/app_exception.dart';
import 'package:physics_feed/core/utils/app_router.dart';
import 'package:physics_feed/models/tag_model.dart';
import 'package:physics_feed/repository/article_repository.dart';
import 'package:physics_feed/views/filter_article/filter_article_view.dart';

class TagViewmodel extends ChangeNotifier {
  final ArticleRepository repository;

  TagViewmodel(this.repository);
  // : _repository = repository ?? ArticleRepository();
  bool isLoading = false;
  List<TagModel?> _tags = [];
  List<TagModel?> get tags => _tags;

  String? error;
  Future<void> fetchTags() async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      _tags = await repository.fetchTags();
      error = null;
    } on AppException catch (e) {
      error = e.message;
    } catch (e) {
      _tags = [];
      error = 'Failed to load tags: $e';
    }
    isLoading = false;
    notifyListeners();
  }

  void navigateToFilterArticle({required String slug}) {
    AppRouter.navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (_) => FilterArticleView(slug: slug)),
    );
  }
}
