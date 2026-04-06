import 'package:flutter/material.dart';
import 'package:physics_feed/views/filter_article/widgets/article_card.dart';

class ArticleList extends StatelessWidget {
  final List filterArticles;

  const ArticleList({super.key, required this.filterArticles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: filterArticles.length,
      itemBuilder: (context, index) {
        final filterArticle = filterArticles[index];
        return ArticleCard(filterArticle: filterArticle, onTap: () {});
      },
    );
  }
}
