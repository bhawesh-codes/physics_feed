import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:physics_feed/models/article_model.dart';
import 'package:physics_feed/views/home/home_view_model.dart';
import 'package:physics_feed/views/home/widgets/article_card.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(),
      child: Scaffold(
        body: Consumer<HomeViewModel>(
          builder: (context, vm, child) => PagingListener(
            controller: vm.pagingController,
            builder: (context, state, fetchNextPage) =>
                PagedListView<int, Result>(
                  state: state,
                  fetchNextPage: fetchNextPage,
                  builderDelegate: PagedChildBuilderDelegate<Result>(
                    itemBuilder: (context, article, index) => ArticleCard(
                      article: article,
                      onTap: () =>
                          vm.navigateToDetail(slug: article.slug ?? ''),
                    ),
                    firstPageProgressIndicatorBuilder: (_) => Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
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
                          Text(state.error?.toString()?? 'Something went wrong'),
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
