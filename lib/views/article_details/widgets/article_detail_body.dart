import 'package:flutter/material.dart';
import 'package:physics_feed/models/article_detail_model.dart';
import 'package:physics_feed/views/article_details/widgets/article_detail_content.dart';
import 'package:physics_feed/views/article_details/widgets/article_detail_header.dart';
import 'package:physics_feed/views/article_details/widgets/article_detail_image.dart';

class ArticleDetailBody extends StatelessWidget {
  final  ArticleDetailModel article;

  const ArticleDetailBody({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ArticleDetailHeader(title: article.title ?? ""),
            const SizedBox(height: 16),
            ArticleDetailImage(imageUrl: article.featureImage),
            const SizedBox(height: 20),
            ArticleDetailContent(htmlContent: article.content),
          ],
        ),
      ),
    );
  }
}
