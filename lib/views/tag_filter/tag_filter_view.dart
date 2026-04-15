import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:physics_feed/core/theme/theme_extension.dart';
import 'package:physics_feed/models/tag_filter_model.dart';
import 'package:physics_feed/views/dashboard/widgets/my_appbar.dart';
import 'package:physics_feed/views/tag_filter/widgets/article_card.dart';
import 'package:physics_feed/views/tag_filter/tag_filter_viewmodel.dart';
import 'package:provider/provider.dart';

class TagFilterView extends StatelessWidget {
  final String slug;
  const TagFilterView({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TagFilterViewmodel>(
      create: (context) => TagFilterViewmodel(slug: slug),
      child: Scaffold(
        appBar: MyAppBar(),
        body: Consumer<TagFilterViewmodel>(
          builder: (context, vm, child) => PagingListener(
            controller: vm.pagingController,
            builder: (context, state, fetchNextPage) =>
                PagedListView<int, Result>(
                  state: state,
                  fetchNextPage: fetchNextPage,
                  builderDelegate: PagedChildBuilderDelegate<Result>(
                    itemBuilder: (context, article, index) => ArticleCard(
                      tagFilterArticle: article,
                      onTap: () =>
                          vm.navigateToDetail(slug: article.slug ?? ""),
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
                          Text(state.error.toString()),
                          SizedBox(height: 12.r),
                          ElevatedButton(
                            onPressed: vm.pagingController.refresh,
                            child: const Text("Retry"),
                          ),
                        ],
                      ),
                    ),
                    noItemsFoundIndicatorBuilder: (_) =>
                        const Center(child: Text("No article found")),
                    noMoreItemsIndicatorBuilder: (_) => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(child: Text('No more items')),
                    ),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
