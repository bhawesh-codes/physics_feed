import 'package:flutter/material.dart';
import 'package:physics_feed/core/theme/theme_extension.dart';
import 'package:physics_feed/views/home/home_view_model.dart';
import 'package:physics_feed/views/home/widgets/article_list.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel()..fetchArticles(),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            final isLoading = context.select<HomeViewModel, bool>(
              (vm) => vm.isLoading,
            );

            final error = context.select<HomeViewModel, String?>(
              (vm) => vm.error,
            );

            final articles = context.select<HomeViewModel, List?>(
              (vm) => vm.article?.results,
            );

            // 🔹 Loading state
            if (isLoading) {
              return Center(
                child: CircularProgressIndicator(color: context.primaryColor),
              );
            }

            // 🔹 Error state
            if (error != null) {
              return Center(
                child: Text(
                  error,
                  style: context.bodyMedium!.copyWith(color: Colors.red),
                ),
              );
            }

            // 🔹 Empty state
            if (articles == null || articles.isEmpty) {
              return Center(child: Text("No data", style: context.bodyMedium));
            }

            // 🔹 Success state
            return ArticleList(articles: articles);
          },
        ),
      ),
    );
  }
}
