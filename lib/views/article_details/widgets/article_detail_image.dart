import 'package:flutter/material.dart';

class ArticleDetailImage extends StatelessWidget {
  final String? imageUrl;

  const ArticleDetailImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return Container(
        height: 200,
        width: double.infinity,
        color: Colors.grey[350],
        child: const Icon(Icons.image, size: 50, color: Colors.grey),
      );
    }

    return Image.network(imageUrl!, width: double.infinity, fit: BoxFit.cover);
  }
}
