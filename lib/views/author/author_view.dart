import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:physics_feed/core/theme/theme_extension.dart';
import 'package:physics_feed/views/author/author_viewmodel.dart';
import 'package:provider/provider.dart';

class AuthorView extends StatelessWidget {
  const AuthorView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthorViewmodel()..fetchAuthor(),
      builder: (context, child) {
        final isLoading = context.select<AuthorViewmodel, bool>(
          (vm) => vm.isLoading,
        );

        final error = context.select<AuthorViewmodel, String?>((vm) => vm.error);

        final author = context.select<AuthorViewmodel, List?>(
          (vm) => vm.authors,
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

              if (author == []) {
                return Center(
                  child: Text("No data", style: context.bodyMedium),
                );
              }
              return Padding(
                padding: EdgeInsets.all(12.r),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text("Author", style: context.textStyle.titleMedium),
                      SizedBox(height: 10.h),
                      Text(
                        author![0].name ?? "No name",
                        style: context.titleLarge,
                      ),
                      SizedBox(height: 10.h),
                      Text('Description', style: context.textStyle.titleMedium),
                      Text(author[0].description ?? "No description"),
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
