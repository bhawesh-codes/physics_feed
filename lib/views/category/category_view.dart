import 'package:flutter/material.dart';
import 'package:physics_feed/core/theme/theme_extension.dart';
import 'package:physics_feed/core/utils/service_locator.dart';
import 'package:physics_feed/views/category/category_viewmodel.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sl<CategoryViewmodel>()..fetchCategory(),
      builder: (context, child) {
        final vm = context.watch<CategoryViewmodel>();

        return Scaffold(
          body: Builder(
            builder: (context) {
              if (vm.isLoading) {
                return Center(
                  child: CircularProgressIndicator(color: context.primaryColor),
                );
              }

              if (vm.error != null) {
                return Center(
                  child: Text(
                    vm.error!,
                    style: context.bodyMedium!.copyWith(color: Colors.red),
                  ),
                );
              }

              if (vm.category == []) {
                return Center(
                  child: Text("No data", style: context.bodyMedium),
                );
              }
              return ListView.builder(
                itemCount: vm.category.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      height: 310,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: context.colors.outline),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          vm.category[index]!.image == null
                              ? Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(12),
                                      
                                    ),
                                    color: context.colors.onSurfaceVariant
                                        .withAlpha(150),
                                  ),
                                  height: 180,
                                  width: double.infinity,
                                  
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                  child: Image.network(
                                    vm.category[index]!.image ?? '',
                                    height: 180,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: .start,
                              children: [
                                Text(
                                  vm.category[index]!.name ?? "",
                                  style: context.textStyle.titleMedium,
                                ),
                                Text(
                                  vm.category[index]!.description ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: context.bodyMedium,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "${vm.category[index]!.articleCount.toString()} articles",
                                  style: context.textStyle.bodySmall!.copyWith(
                                    color: context.colors.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
