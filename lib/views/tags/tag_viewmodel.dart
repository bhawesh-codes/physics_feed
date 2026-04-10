import 'package:flutter/material.dart';
import 'package:physics_feed/core/utils/app_router.dart';
import 'package:physics_feed/core/utils/service_locator.dart';
import 'package:physics_feed/models/tag_model.dart';
import 'package:physics_feed/repository/article_repository.dart';
import 'package:physics_feed/views/tag_filter/tag_filter_view.dart';

class TagViewmodel extends ChangeNotifier {
  final ArticleRepository _repository = sl<ArticleRepository>();

  TagViewmodel();
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
      _tags = await _repository.fetchTags();
      error = null;
    } catch (e) {
      _tags = [];
      error = 'Failed to load tags: $e';
    }
    isLoading = false;
    notifyListeners();
  }

  void navigateToTagFilter({required String slug}) {
    AppRouter.navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (_) => TagFilterView(slug: slug)),
    );
  }
}
