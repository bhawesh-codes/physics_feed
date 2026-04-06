import 'package:flutter/material.dart';
import 'package:physics_feed/views/tag_filter/widgets/article_card.dart';

class ArticleList extends StatelessWidget {
  final List tagFilterArticles;

  const ArticleList({super.key, required this.tagFilterArticles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: tagFilterArticles.length,
      itemBuilder: (context, index) {
        final tagFilterArticle = tagFilterArticles[index];
        return ArticleCard(tagFilterArticle: tagFilterArticle, onTap: () {},);
      },
    );
  }
}
