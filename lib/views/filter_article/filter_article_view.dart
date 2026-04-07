import 'package:flutter/material.dart';
import 'package:physics_feed/core/theme/theme_extension.dart';
import 'package:physics_feed/views/dashboard/widgets/my_appbar.dart';
import 'package:physics_feed/views/filter_article/filter_article_viewmodel.dart';
import 'package:physics_feed/views/filter_article/widgets/article_list.dart'
    show ArticleList;
import 'package:provider/provider.dart';

class FilterArticleView extends StatelessWidget {
  final String slug;
  const FilterArticleView({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FilterArticleViewmodel>(
      create: (context) =>
          FilterArticleViewmodel()..fetchFilterArticle(slug),
      builder: (context, child) {
        final vm = context.watch<FilterArticleViewmodel>();
        // final colors = Theme.of(context).colorScheme;
        // final textTheme = Theme.of(context).textTheme;

        return Scaffold(
          appBar: MyAppBar(),
          body: Builder(
            builder: (context) {
              if (vm.isLoading) {
                return Center(
                  child: CircularProgressIndicator(color: context.primaryColor),
                );
              }

              if (vm.error != null) {
                return Center(
                  child: Text(
                    vm.error!,
                    style: context.bodyMedium!.copyWith(color: Colors.red),
                  ),
                );
              }

              if (vm.filterArticle == null ||
                  vm.filterArticle!.articles == null ||
                  vm.filterArticle!.articles!.results!.isEmpty) {
                return Center(
                  child: Text("No data", style: context.bodyMedium),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(12),
                child: ListView(
                  children: [
                    Text(
                      'Articles under categorty ${vm.filterArticle!.name}',
                      style: context.titleLarge,
                    ),
                    ArticleList(
                      filterArticles: vm.filterArticle!.articles!.results!,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
