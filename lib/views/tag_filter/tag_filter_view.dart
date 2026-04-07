import 'package:flutter/material.dart';
import 'package:physics_feed/core/theme/theme_extension.dart';
import 'package:physics_feed/views/dashboard/widgets/my_appbar.dart';
import 'package:physics_feed/views/tag_filter/widgets/article_list.dart'
    show ArticleList;
import 'package:physics_feed/views/tag_filter/tag_filter_viewmodel.dart';
import 'package:provider/provider.dart';

class TagFilterView extends StatelessWidget {
  final String slug;
  const TagFilterView({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TagFilterViewmodel>(
      create: (context) => TagFilterViewmodel()..fetchTags(slug),
      builder: (context, child) {
        final vm = context.watch<TagFilterViewmodel>();
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

              if (vm.tagFilterArticle == null ||
                  vm.tagFilterArticle!.articles == null ||
                  vm.tagFilterArticle!.articles!.results!.isEmpty) {
                return Center(
                  child: Text("No data", style: context.bodyMedium),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(12),
                child: ListView(
                  children: [
                    Text(
                      'Articles under tag ${vm.tagFilterArticle!.name}',
                      style: context.titleLarge,
                    ),
                    ArticleList(
                      tagFilterArticles:
                          vm.tagFilterArticle!.articles!.results!,
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
