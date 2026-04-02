import 'package:flutter/material.dart';
import 'package:physics_feed/views/home/home_view.dart';
import 'package:physics_feed/views/dashboard/dashboard_viewmodel.dart';
import 'package:physics_feed/views/dashboard/widgets/bottom_nav_bar.dart';
import 'package:physics_feed/views/dashboard/widgets/my_appbar.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      HomeView(),
      const Center(child: Text('Categories')),
      const Center(child: Text('Tags')),
      const Center(child: Text('Authors')),
    ];
    return ChangeNotifierProvider<DashboardViewmodel>(
      create: (context) => DashboardViewmodel(),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: MyAppBar(),
          body: screen[context.watch<DashboardViewmodel>().pageIndex],
          bottomNavigationBar: BottomNavBar(
            pageIndex: context.watch<DashboardViewmodel>().pageIndex,
          ),
        ),
      ),
    );
  }
}
