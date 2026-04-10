import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:physics_feed/core/theme/theme_extension.dart';
import 'package:physics_feed/views/category/category_viewmodel.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CategoryViewmodel()..fetchCategory(),
      builder: (context, child) {
        final isLoading = context.select<CategoryViewmodel, bool>(
          (vm) => vm.isLoading,
        );

        final error = context.select<CategoryViewmodel, String?>(
          (vm) => vm.error,
        );

        final category = context.select<CategoryViewmodel, List?>(
          (vm) => vm.category,
        );

        return Scaffold(
          body: Builder(
            builder: (context) {
              if (isLoading) {
                return Center(
                  child: CircularProgressIndicator(color: context.primaryColor),
                );
              }

              if (error != null) {
                return Center(
                  child: Text(
                    error,
                    style: context.bodyMedium!.copyWith(color: Colors.red),
                  ),
                );
              }

              if (category == []) {
                return Center(
                  child: Text("No data", style: context.bodyMedium),
                );
              }
              return ListView.builder(
                itemCount: category!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(12.r),
                    child: GestureDetector(
                      onTap: () => context
                          .read<CategoryViewmodel>()
                          .navigateToFilterArticle(
                            slug: category[index]!.slug!,
                          ),
                      child: Container(
                        height: 245.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: context.colors.outline),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          children: [
                            category[index]!.image == null
                                ? Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(12.r),
                                      ),
                                      color: context
                                          .colors
                                          .surfaceContainerHighest,
                                    ),
                                    height: 130.h,
                                    width: double.infinity,
                                    child: Icon(
                                      Icons.image,
                                      size: 50.r,
                                      color: context.colors.onSurfaceVariant,
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(12.r),
                                    ),
                                    child: Image.network(
                                      category[index]!.image ?? '',
                                      height: 130.h,
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                    ),
                                  ),

                            Padding(
                              padding: EdgeInsets.all(8.0.r),
                              child: Column(
                                crossAxisAlignment: .start,
                                children: [
                                  Text(
                                    category[index]!.name ?? "",
                                    style: context.textStyle.titleMedium,
                                  ),
                                  Text(
                                    category[index]!.description ?? "",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: context.bodyMedium,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "${category[index]!.articleCount.toString()} articles",
                                    style: context.textStyle.bodySmall!
                                        .copyWith(
                                          color:
                                              context.colors.onSurfaceVariant,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
