import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:physics_feed/views/article_details/article_detail_viewmodel.dart';
import 'package:provider/provider.dart';

class ArticleDetailView extends StatelessWidget {
  final String slug;

  const ArticleDetailView({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ChangeNotifierProvider(
      create: (_) => ArticleDetailViewmodel()..fetchArticleDetail(slug),
      builder: (context, child) {
        final vm = context.watch<ArticleDetailViewmodel>();
        return Scaffold(
          appBar: AppBar(
            title: Text('Details Screen', style: textTheme.titleLarge),
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

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        vm.articleDetail!.title!,
                        style: textTheme.titleLarge,
                      ),
                      SizedBox(height: 16),
                      vm.articleDetail!.featureImage == null
                          ? Container(color: Colors.grey[350])
                          : Image.network(vm.articleDetail!.featureImage!),
                      SizedBox(height: 20),
                      // Text(vm.articleDetail!.content!),
                      Html(data: vm.articleDetail!.content)
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
