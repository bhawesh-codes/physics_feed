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
        final isLoading = context.select<TagViewmodel, bool>(
          (vm) => vm.isLoading,
        );

        final error = context.select<TagViewmodel, String?>((vm) => vm.error);

        final tags = context.select<TagViewmodel, List?>(
          (vm) => vm.tags,
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

              if (tags == []) {
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
                itemCount: tags!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => context
                        .read<TagViewmodel>()
                        .navigateToTagFilter(slug: tags[index]!.slug!),
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
                            tags[index]!.name ?? "No name",
                            style: context.bodyMedium!.copyWith(
                              color: context.colors.onSurface,
                            ),
                          ),
                          // SizedBox(width: 4),
                          Text(
                            "(${tags[index]!.articleCount ?? 0})",
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
