import 'package:flutter/material.dart';
import 'package:physics_feed/core/theme/theme_extension.dart';
import 'package:physics_feed/models/tag_filter_model.dart';
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
        final isLoading = context.select<TagFilterViewmodel, bool>(
          (vm) => vm.isLoading,
        );

        final error = context.select<TagFilterViewmodel, String?>((vm) => vm.error);

        final tagFilterArticle = context.select<TagFilterViewmodel, TagFilterModel?>(
          (vm) => vm.tagFilterArticle,
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

              if (tagFilterArticle == null ||
                  tagFilterArticle.articles == null ||
                  tagFilterArticle.articles!.results!.isEmpty) {
                return Center(
                  child: Text("No data", style: context.bodyMedium),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(12),
                child: ListView(
                  children: [
                    Text(
                      'Articles under tag ${tagFilterArticle.name}',
                      style: context.titleLarge,
                    ),
                    ArticleList(
                      tagFilterArticles:
                          tagFilterArticle.articles!.results!,
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
