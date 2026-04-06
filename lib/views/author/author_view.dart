import 'package:flutter/material.dart';
import 'package:physics_feed/core/theme/theme_extension.dart';
import 'package:physics_feed/core/utils/service_locator.dart';
import 'package:physics_feed/views/author/author_viewmodel.dart';
import 'package:provider/provider.dart';

class AuthorView extends StatelessWidget {
  const AuthorView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sl<AuthorViewmodel>()..fetchAuthor(),
      builder: (context, child) {
        final vm = context.watch<AuthorViewmodel>();

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

              if (vm.authors == []) {
                return Center(
                  child: Text("No data", style: context.bodyMedium),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text("Author", style: context.textStyle.titleMedium),
                      SizedBox(height: 10),
                      Text(
                        vm.authors[0]!.name ?? "No name",
                        style: context.titleLarge,
                      ),
                      SizedBox(height: 10),
                      Text('Description', style: context.textStyle.titleMedium),
                      Text(vm.authors[0]!.description ?? "No description"),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
