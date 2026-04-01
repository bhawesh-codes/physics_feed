import 'package:flutter/material.dart';

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
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: textTheme.titleMedium,
      ),
      subtitle: Text(
        excerpt,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: textTheme.bodyMedium,
      ),
    );
  }
}
