import 'package:flutter/material.dart';
import 'package:physics_feed/views/home/home_view_model.dart';
import 'package:physics_feed/views/home/widgets/article_card.dart';
import 'package:provider/provider.dart';

class ArticleList extends StatelessWidget {
  final List articles;

  const ArticleList({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return ArticleCard(
          article: article,
          onTap: () => context.read<HomeViewModel>().navigateToDetail(slug: article.slug!),
        );
      },
    );
  }
}
