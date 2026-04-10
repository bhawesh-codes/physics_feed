import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:physics_feed/core/theme/theme_extension.dart';

class ArticleCardImage extends StatelessWidget {
  final String? imageUrl;

  const ArticleCardImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return Container(
        height: 120.h,
        width: double.infinity,
        color: context.colors.surfaceContainerHighest,
        child: Icon(
          Icons.image,
          size: 50.r,
          color: context.colors.onSurfaceVariant,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
      child: Image.network(
        imageUrl!,
        height: 120.h,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
//       child:CachedNetworkImage(
//   height: 150,
//   width: double.infinity,
//   fit: BoxFit.cover,
//   imageUrl: imageUrl!,
//   placeholder: (context, url) {
//     debugPrint('Loading image: $url');  // add this
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(160, 50, 160, 50),
//       child: CircularProgressIndicator(),
//     );
//   },
//   errorWidget: (context, url, error) {
//     debugPrint('Image error [$url]: $error');  // add this
//     return Icon(Icons.error);
//   },
// ),
    );
  }
}
