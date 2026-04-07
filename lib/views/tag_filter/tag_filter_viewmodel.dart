import 'package:flutter/material.dart';
import 'package:physics_feed/core/error/app_exception.dart';
import 'package:physics_feed/core/utils/service_locator.dart';
import 'package:physics_feed/models/tag_filter_model.dart';
import 'package:physics_feed/repository/article_repository.dart';

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
    } on AppException catch (e) {
      error = e.message;
    } catch (e) {
      _tagFilterArticle = null;
      error = 'Failed to load tags: $e';
    }
    isLoading = false;
    notifyListeners();
  }

}
