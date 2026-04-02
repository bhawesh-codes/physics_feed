import 'package:flutter/material.dart';
import 'package:physics_feed/core/error/app_exception.dart';
import 'package:physics_feed/models/article_model.dart';
import 'package:physics_feed/repository/article_repository.dart';

class HomeViewModel extends ChangeNotifier{
  final ArticleRepository _repository;

  HomeViewModel(this._repository);
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
      
    } on AppException catch (e) {
      error = e.message;}
      catch (e) {
      error = 'Failed to load articles: $e';
      _article = null;
    } 
      isLoading = false;
      notifyListeners();
    }
    
    }
    
  
