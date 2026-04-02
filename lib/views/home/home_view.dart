import 'package:flutter/material.dart';
import 'package:physics_feed/core/utils/service_locator.dart';
import 'package:physics_feed/views/home/home_view_model.dart';
import 'package:physics_feed/views/home/widgets/article_list.dart' show ArticleList;
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(ServiceLocator.articleRepository)..fetchArticles(),
      builder: (context, child) {
        final vm = context.watch<HomeViewModel>();
        final colors = Theme.of(context).colorScheme;
        final textTheme = Theme.of(context).textTheme;

        return Scaffold(
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

              if (vm.article == null ||
                  vm.article!.results == null ||
                  vm.article!.results!.isEmpty) {
                return Center(
                  child: Text("No data", style: textTheme.bodyMedium),
                );
              }

              return ArticleList(articles: vm.article!.results!);
            },
          ),
        );
      },
    );
  }
}
