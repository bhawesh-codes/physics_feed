import 'package:flutter/material.dart';
import 'package:physics_feed/core/theme/theme_extension.dart';
import 'package:physics_feed/core/utils/service_locator.dart';
import 'package:physics_feed/views/article_details/article_detail_viewmodel.dart';
import 'package:physics_feed/views/article_details/widgets/article_detail_body.dart';
import 'package:provider/provider.dart';

class ArticleDetailView extends StatelessWidget {
  final String slug;

  const ArticleDetailView({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => ArticleDetailViewmodel(ServiceLocator.articleRepository)..fetchArticleDetail(slug),
      builder: (context, child) {
        final vm = context.watch<ArticleDetailViewmodel>();

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Details Screen',
              style: context.titleLarge!.copyWith(color: context.colors.onPrimary),
            ),
          ),
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

              if (vm.articleDetail == null) {
                return Center(
                  child: Text("No data", style: context.bodyMedium),
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
