import 'package:flutter/material.dart';
import 'package:physics_feed/core/utils/app_router.dart';
import 'package:physics_feed/core/utils/service_locator.dart';
import 'package:physics_feed/models/article_model.dart';
import 'package:physics_feed/repository/article_repository.dart';
import 'package:physics_feed/views/article_details/article_detail_view.dart';

class HomeViewModel extends ChangeNotifier {
  final _repository = sl<ArticleRepository>();

  HomeViewModel();
  // : _repository = repository ?? ArticleRepository();

  bool isLoading = false;
  ArticleModel? _article;
  ArticleModel? get article => _article;

  String? error;
  Future<void> fetchArticles() async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      _article = await _repository.fetchArticles();
    } catch (e) {
      error = 'Failed to load articles: $e';
      _article = null;
    }
    isLoading = false;
    notifyListeners();
  }
  

  void navigateToDetail({required String slug}) {
    AppRouter.navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (_) => ArticleDetailView(slug: slug),
      ),
    );
  }
}

