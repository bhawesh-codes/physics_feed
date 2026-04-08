import 'package:flutter/material.dart';
import 'package:physics_feed/core/theme/theme_extension.dart';
import 'package:physics_feed/models/article_detail_model.dart';
import 'package:physics_feed/views/article_details/article_detail_viewmodel.dart';
import 'package:physics_feed/views/article_details/widgets/article_detail_body.dart';
import 'package:provider/provider.dart';

class ArticleDetailView extends StatelessWidget {
  final String slug;

  const ArticleDetailView({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => ArticleDetailViewmodel()..fetchArticleDetail(slug),
      builder: (context, child) {
        final isLoading = context.select<ArticleDetailViewmodel, bool>(
          (vm) => vm.isLoading,
        );

        final error = context.select<ArticleDetailViewmodel, String?>((vm) => vm.error);

        final articleDetail = context.select<ArticleDetailViewmodel, ArticleDetailModel?>(
          (vm) => vm.articleDetail,
        );


        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Details Screen',
              style: context.titleLarge!.copyWith(color: context.colors.onPrimary),
            ),
          ),
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

              if (articleDetail == null) {
                return Center(
                  child: Text("No data", style: context.bodyMedium),
                );
              }

              return ArticleDetailBody(article: articleDetail);
            },
          ),
        );
      },
    );
  }
}
