import 'package:flutter/material.dart';
import 'package:physics_feed/views/article_details/article_detail_view.dart';
import 'package:physics_feed/views/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel()..fetchArticles(),
      builder: (context, child) {
        final vm = context.watch<HomeViewModel>();
        final colors = Theme.of(context).colorScheme;
        final textTheme = Theme.of(context).textTheme;

        return Scaffold(
          body: Builder(
            builder: (context) {
              // 🔄 Loading
              if (vm.isLoading) {
                return Center(
                  child: CircularProgressIndicator(color: colors.primary),
                );
              }
              if (vm.error != null) {
                return Center(
                  child: Text(
                    vm.error!,
                    style: textTheme.bodyMedium!.copyWith(color: Colors.red),
                  ),
                );
              }

              if (vm.article == null ||
                  vm.article!.results == null ||
                  vm.article!.results!.isEmpty) {
                return Center(
                  child: Text("No data", style: textTheme.bodyMedium),
                );
              }

              // ✅ Data Loaded
              final articles = vm.article!.results!;

              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticleDetailView(slug: articles[index].slug!),
                          ),
                        );
                      },
                      child: Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: colors.outline),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            // 🖼 Image
                            article.featureImage == null
                                ? Container(
                                    height: 150,
                                    width: double.infinity,
                                    color: colors.surfaceContainerHighest,
                                    child: Icon(
                                      Icons.image,
                                      size: 50,
                                      color: colors.onSurfaceVariant,
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),
                                    child: Image.network(
                                      article.featureImage!,
                                      height: 150,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                            // 📝 Content
                            ListTile(
                              title: Text(
                                article.title ?? "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.titleMedium,
                              ),
                              subtitle: Text(
                                article.excerpt ?? "",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.bodyMedium,
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
