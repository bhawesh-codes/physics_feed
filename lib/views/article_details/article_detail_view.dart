import 'package:flutter/material.dart';
import 'package:physics_feed/views/article_details/article_detail_viewmodel.dart';
import 'package:physics_feed/views/article_details/widgets/article_detail_body.dart';
import 'package:provider/provider.dart';

class ArticleDetailView extends StatelessWidget {
  final String slug;

  const ArticleDetailView({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return ChangeNotifierProvider(
      create: (_) => ArticleDetailViewmodel()..fetchArticleDetail(slug),
      builder: (context, child) {
        final vm = context.watch<ArticleDetailViewmodel>();

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Details Screen',
              style: textTheme.titleLarge!.copyWith(color: colors.onPrimary),
            ),
          ),
          body: Builder(
            builder: (context) {
              if (vm.isLoading) {
                return Center(
                  child: CircularProgressIndicator(color: colors.primary),
                );
              }

              if (vm.error != null) {
                return Center(
                  child: Text(
                    vm.error!,
                    style: textTheme.bodyMedium!.copyWith(color: Colors.red),
                  ),
                );
              }

              if (vm.articleDetail == null) {
                return Center(
                  child: Text("No data", style: textTheme.bodyMedium),
                );
              }

              return ArticleDetailBody(article: vm.articleDetail!);
            },
          ),
        );
      },
    );
  }
}
