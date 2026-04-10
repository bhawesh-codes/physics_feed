import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleDetailImage extends StatelessWidget {
  final String? imageUrl;

  const ArticleDetailImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return Container(
        height: 200.h,
        width: double.infinity,
        color: Colors.grey[350],
        child: Icon(Icons.image, size: 50.r, color: Colors.grey),
      );
    }

    return Image.network(imageUrl!, width: double.infinity, fit: BoxFit.cover);
  }
}
