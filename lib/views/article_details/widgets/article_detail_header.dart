import 'package:flutter/material.dart';
import 'package:physics_feed/core/theme/theme_extension.dart';

class ArticleDetailHeader extends StatelessWidget {
  final String title;

  const ArticleDetailHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
   

    return Text(title, style: context.titleLarge);
  }
}
