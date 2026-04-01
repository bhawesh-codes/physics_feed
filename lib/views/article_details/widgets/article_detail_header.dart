import 'package:flutter/material.dart';

class ArticleDetailHeader extends StatelessWidget {
  final String title;

  const ArticleDetailHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(title, style: textTheme.titleLarge);
  }
}
