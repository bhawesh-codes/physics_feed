import 'package:flutter/material.dart';
import 'package:physics_feed/core/theme/theme_extension.dart';
import 'package:physics_feed/views/tags/tag_viewmodel.dart';
import 'package:provider/provider.dart';

class TagView extends StatelessWidget {
  const TagView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TagViewmodel()..fetchTags(),
      builder: (context, child) {
        final vm = context.watch<TagViewmodel>();

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

              if (vm.tags == []) {
                return Center(
                  child: Text("No data", style: context.bodyMedium),
                );
              }
              return GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 3,
                ),
                itemCount: vm.tags.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => context
                        .read<TagViewmodel>()
                        .navigateToTagFilter(slug: vm.tags[index]!.slug!),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: context.colors.outline),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: .spaceAround,
                        children: [
                          Text(
                            vm.tags[index]!.name ?? "No name",
                            style: context.bodyMedium!.copyWith(
                              color: context.colors.onSurface,
                            ),
                          ),
                          // SizedBox(width: 4),
                          Text(
                            "(${vm.tags[index]!.articleCount ?? 0})",
                            style: context.textStyle.bodySmall!.copyWith(
                              color: context.colors.onSurfaceVariant,
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
