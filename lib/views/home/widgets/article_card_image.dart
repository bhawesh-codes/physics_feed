import 'package:flutter/material.dart';

class ArticleCardImage extends StatelessWidget {
  final String? imageUrl;

  const ArticleCardImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    if (imageUrl == null) {
      return Container(
        height: 150,
        width: double.infinity,
        color: colors.surfaceContainerHighest,
        child: Icon(Icons.image, size: 50, color: colors.onSurfaceVariant),
      );
    }

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      child: Image.network(
        imageUrl!,
        height: 150,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
