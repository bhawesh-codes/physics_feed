import 'package:flutter/material.dart';
import 'package:physics_feed/core/theme/theme_extension.dart';
import 'package:physics_feed/views/home/widgets/article_card_content.dart';
import 'package:physics_feed/views/home/widgets/article_card_image.dart';

class ArticleCard extends StatelessWidget {
  final dynamic article;
  final VoidCallback onTap;

  const ArticleCard({super.key, required this.article, required this.onTap});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: context.colors.outline),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              ArticleCardImage(imageUrl: article.featureImage),
              ArticleCardContent(
                title: article.title ?? "",
                excerpt: article.excerpt ?? "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
