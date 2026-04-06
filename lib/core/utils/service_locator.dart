import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:physics_feed/repository/article_repository.dart';
import 'package:physics_feed/services/article_api_client.dart';
import 'package:physics_feed/services/dio_client.dart';
import 'package:physics_feed/views/article_details/article_detail_viewmodel.dart';
import 'package:physics_feed/views/category/category_viewmodel.dart';
import 'package:physics_feed/views/home/home_view_model.dart';

final GetIt sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton<Dio>(() => DioClient().dio);
   // Retrofit client — uses the registered Dio
  sl.registerLazySingleton<ArticleApiClient>(() => ArticleApiClient(sl<Dio>()));

  
  sl.registerLazySingleton<ArticleRepository>(() => ArticleRepository(sl<ArticleApiClient>()));

  sl.registerFactory<HomeViewModel>(() => HomeViewModel(sl()));
  sl.registerFactory<ArticleDetailViewmodel>(() => ArticleDetailViewmodel(sl()));
  sl.registerFactory<CategoryViewmodel>(() => CategoryViewmodel(sl()));
}
