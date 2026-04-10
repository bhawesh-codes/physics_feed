import 'package:flutter/material.dart';
import 'package:physics_feed/core/utils/app_router.dart';
import 'package:physics_feed/core/utils/service_locator.dart';
import 'package:physics_feed/models/category_model.dart';
import 'package:physics_feed/repository/article_repository.dart';
import 'package:physics_feed/views/filter_article/filter_article_view.dart';

class CategoryViewmodel extends ChangeNotifier{
  final _repository = sl<ArticleRepository>();

  CategoryViewmodel();
      // : _repository = repository ?? ArticleRepository();
  bool isLoading = false;
  List<CategoryModel?> _category = [];
  List<CategoryModel?> get category => _category;

  String? error;
  Future<void> fetchCategory() async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      _category = await _repository.fetchCategories();
      error = null;
    } catch (e) {
      _category = [];
      error = 'Failed to load category: $e';
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

