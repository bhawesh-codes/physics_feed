import 'package:flutter/material.dart';
import 'package:physics_feed/core/error/app_exception.dart';
import 'package:physics_feed/models/category_model.dart';
import 'package:physics_feed/repository/article_repository.dart';

class CategoryViewmodel extends ChangeNotifier{
  final ArticleRepository repository;

  CategoryViewmodel(this.repository);
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
      _category = await repository.fetchCategories();
      error = null;
      
    } on AppException catch (e) {
      error = e.message;
    } catch (e) {
      _category = [];
      error = 'Failed to load category: $e';
    }
    isLoading = false;
    notifyListeners();
  }
}

