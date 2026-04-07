import 'package:flutter/material.dart';
import 'package:physics_feed/core/theme/theme_extension.dart';
import 'package:physics_feed/views/home/home_view_model.dart';
import 'package:physics_feed/views/home/widgets/article_list.dart' show ArticleList;
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel()..fetchArticles(),
      builder: (context, child) {
        final vm = context.watch<HomeViewModel>();
        // final colors = Theme.of(context).colorScheme;
        // final textTheme = Theme.of(context).textTheme;

        return Scaffold(
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

              if (vm.article == null ||
                  vm.article!.results == null ||
                  vm.article!.results!.isEmpty) {
                return Center(
                  child: Text("No data", style: context.bodyMedium),
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
