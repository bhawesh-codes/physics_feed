import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:physics_feed/core/theme/theme_extension.dart';
import 'package:physics_feed/models/filter_article_model.dart';
import 'package:physics_feed/views/dashboard/widgets/my_appbar.dart';
import 'package:physics_feed/views/filter_article/filter_article_viewmodel.dart';
import 'package:physics_feed/views/filter_article/widgets/article_card.dart';
import 'package:provider/provider.dart';

class FilterArticleView extends StatelessWidget {
  final String slug;
  const FilterArticleView({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FilterArticleViewmodel>(
      create: (context) => FilterArticleViewmodel(slug: slug),
      child: Scaffold(
        appBar: MyAppBar(),
        body: Consumer<FilterArticleViewmodel>(
          builder: (context, vm, child) => PagingListener(
            controller: vm.pagingController,
            builder: (context, state, fetchNextPage) =>
                PagedListView<int, Result>(
                  state: state,
                  fetchNextPage: fetchNextPage,
                  builderDelegate: PagedChildBuilderDelegate<Result>(
                    itemBuilder: (context, article, index) => ArticleCard(
                      filterArticle: article,
                      onTap: () =>
                          vm.navigateToDetail(slug: article.slug ?? ''),
                    ),
                    firstPageProgressIndicatorBuilder: (_) => Center(
                      child: CircularProgressIndicator(
                        color: context.primaryColor,
                      ),
                    ),
                    newPageProgressIndicatorBuilder: (_) => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    firstPageErrorIndicatorBuilder: (_) => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.error?.toString() ?? "Something went wrong",
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: vm.pagingController.refresh,
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                    noItemsFoundIndicatorBuilder: (_) =>
                        const Center(child: Text('No articles found')),
                    noMoreItemsIndicatorBuilder: (_) => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(child: Text("You're all caught up")),
                    ),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
