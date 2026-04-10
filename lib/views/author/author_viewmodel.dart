import 'package:flutter/material.dart';
import 'package:physics_feed/core/utils/service_locator.dart';
import 'package:physics_feed/models/author_model.dart';
import 'package:physics_feed/repository/article_repository.dart';

class AuthorViewmodel extends ChangeNotifier {
  final ArticleRepository _repository = sl<ArticleRepository>();

  AuthorViewmodel();
  // : _repository = repository ?? ArticleRepository();
  bool isLoading = false;
  List<AuthorModel?> _authors = [];
  List<AuthorModel?> get authors => _authors;

  String? error;
  Future<void> fetchAuthor() async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      _authors = await _repository.fetchAuthor();
      error = null;
    } catch (e) {
      _authors = [];
      error = 'Failed to load authors: $e';
    }
    isLoading = false;
    notifyListeners();
  }

}
