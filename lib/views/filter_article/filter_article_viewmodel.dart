import 'package:flutter/material.dart';
import 'package:physics_feed/core/error/app_exception.dart';
import 'package:physics_feed/models/filter_article_model.dart';
import 'package:physics_feed/repository/article_repository.dart';

class FilterArticleViewmodel extends ChangeNotifier {
  final ArticleRepository repository;

  FilterArticleViewmodel(this.repository);
  // : _repository = repository ?? ArticleRepository();
  bool isLoading = false;
  FilterArticleModel? _filterArticle;
  FilterArticleModel? get filterArticle => _filterArticle;

  String? error;
  Future<void> fetchFilterArticle(String slug) async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      _filterArticle = await repository.fetchFilterArticle(slug);
      error = null;
    } on AppException catch (e) {
      error = e.message;
    } catch (e) {
      _filterArticle = null;
      error = 'Failed to load filter article: $e';
    }
    isLoading = false;
    notifyListeners();
  }
  
}
