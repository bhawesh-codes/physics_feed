import 'package:flutter/material.dart';
import 'package:physics_feed/models/article_detail_model.dart';
import 'package:physics_feed/repository/article_repository.dart';

class ArticleDetailViewmodel extends ChangeNotifier {
   final ArticleRepository _repository;

  ArticleDetailViewmodel({ArticleRepository? repository})
      : _repository = repository ?? ArticleRepository();
  bool isLoading = false;
  ArticleDetailModel? _articleDetail;
  ArticleDetailModel? get articleDetail => _articleDetail;

  String? error;
  Future<void> fetchArticleDetail(String slug) async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      _articleDetail = await _repository.fetchArticleDetail(slug);
      error = null;
      
    } catch (e) {
      _articleDetail = null;
      throw Exception(e.toString());
    }
    isLoading = false;
    notifyListeners();
  }
}
