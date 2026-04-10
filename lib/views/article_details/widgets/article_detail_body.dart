import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:physics_feed/models/article_detail_model.dart';
import 'package:physics_feed/views/article_details/widgets/article_detail_content.dart';
import 'package:physics_feed/views/article_details/widgets/article_detail_header.dart';
import 'package:physics_feed/views/article_details/widgets/article_detail_image.dart';

class ArticleDetailBody extends StatelessWidget {
  final ArticleDetailModel article;

  const ArticleDetailBody({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ArticleDetailHeader(title: article.title ?? ""),
            SizedBox(height: 16.h),
            ArticleDetailImage(imageUrl: article.featureImage),
            SizedBox(height: 20.h),
            ArticleDetailContent(htmlContent: article.content),
          ],
        ),
      ),
    );
  }
}
