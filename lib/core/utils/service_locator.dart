import 'package:physics_feed/repository/article_repository.dart';
import 'package:physics_feed/services/api_service.dart';

class ServiceLocator {
  static final ApiService apiService = ApiService();
  static final ArticleRepository articleRepository = ArticleRepository(
    apiService,
  );
}
