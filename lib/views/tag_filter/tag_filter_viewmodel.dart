import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:physics_feed/core/utils/app_router.dart';
import 'package:physics_feed/core/utils/service_locator.dart';
import 'package:physics_feed/models/tag_filter_model.dart';
import 'package:physics_feed/repository/article_repository.dart';
import 'package:physics_feed/views/article_details/article_detail_view.dart';

class TagFilterViewmodel extends ChangeNotifier {
  final ArticleRepository _repository = sl<ArticleRepository>();
  final String slug;

  int _totalPages = 1;
  late final PagingController<int, Result> pagingController;

  TagFilterViewmodel({required this.slug}){
    pagingController = PagingController(getNextPageKey: (state){
      final nextPage = (state.keys?.last ?? 0) + 1;
      return nextPage > _totalPages ? null : nextPage;
    }, fetchPage: (pageKey)async {
      final response = await _repository.fetchTagFilter(slug, pageKey);
      _totalPages = response.articles!.pagination?.pages ?? 1;
      return response.articles?.results ?? [];
    });
  }

  
  void navigateToDetail({required String slug}) {
    AppRouter.navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (_) => ArticleDetailView(slug: slug)),
    );
  }
  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

}
