import 'package:flutter/material.dart';
import 'package:physics_feed/views/article_details/article_detail_view.dart';
import 'package:physics_feed/views/home/widgets/article_card.dart';

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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleDetailView(slug: article.slug!),
              ),
            );
          },
        );
      },
    );
  }
}
