import 'package:flutter/material.dart';
import 'package:physics_feed/views/author/author_view.dart';
import 'package:physics_feed/views/category/category_view.dart';
import 'package:physics_feed/views/dashboard/dashboard_viewmodel.dart';
import 'package:physics_feed/views/dashboard/widgets/bottom_nav_bar.dart';
import 'package:physics_feed/views/dashboard/widgets/my_appbar.dart';
import 'package:physics_feed/views/home/home_view.dart';
import 'package:physics_feed/views/tags/tag_view.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [HomeView(), CategoryView(), TagView(), AuthorView()];

    return ChangeNotifierProvider<DashboardViewmodel>(
      create: (_) => DashboardViewmodel(),
      child: Builder(
        builder: (context) {
          final pageIndex = context.select<DashboardViewmodel, int>(
            (vm) => vm.pageIndex,
          );

          return Scaffold(
            appBar: MyAppBar(),
            body: screens[pageIndex],
            bottomNavigationBar: BottomNavBar(pageIndex: pageIndex),
          );
        },
      ),
    );
  }
}
