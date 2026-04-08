import 'package:flutter/material.dart';
import 'package:physics_feed/core/theme/theme_extension.dart';
import 'package:physics_feed/models/filter_article_model.dart';
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
       final isLoading = context.select<FilterArticleViewmodel, bool>(
          (vm) => vm.isLoading,
        );

        final error = context.select<FilterArticleViewmodel, String?>((vm) => vm.error);

        final filterArticle = context.select<FilterArticleViewmodel, FilterArticleModel?>(
          (vm) => vm.filterArticle,
        );

        return Scaffold(
          appBar: MyAppBar(),
          body: Builder(
            builder: (context) {
              if (isLoading) {
                return Center(
                  child: CircularProgressIndicator(color: context.primaryColor),
                );
              }

              if (error != null) {
                return Center(
                  child: Text(
                    error,
                    style: context.bodyMedium!.copyWith(color: Colors.red),
                  ),
                );
              }

              if (filterArticle == null ||
                  filterArticle.articles == null ||
                  filterArticle.articles!.results!.isEmpty) {
                return Center(
                  child: Text("No data", style: context.bodyMedium),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(12),
                child: ListView(
                  children: [
                    Text(
                      'Articles under categorty ${filterArticle.name}',
                      style: context.titleLarge,
                    ),
                    ArticleList(
                      filterArticles: filterArticle.articles!.results!,
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
