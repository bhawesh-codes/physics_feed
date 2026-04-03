import 'package:flutter/material.dart';
import 'package:physics_feed/core/theme/theme_extension.dart';

class ArticleCardContent extends StatelessWidget {
  final String title;
  final String excerpt;

  const ArticleCardContent({
    super.key,
    required this.title,
    required this.excerpt,
  });

  @override
  Widget build(BuildContext context) {

    return ListTile(
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.textStyle.titleMedium,
      ),
      subtitle: Text(
        excerpt,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: context.bodyMedium,
      ),
    );
  }
}
