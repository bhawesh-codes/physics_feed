import 'package:flutter/material.dart';
import 'package:physics_feed/views/home/home_view.dart';
import 'package:physics_feed/views/splash/splash_viewmodel.dart';
import 'package:physics_feed/views/splash/widgets/bottom_nav_bar.dart';
import 'package:physics_feed/views/splash/widgets/my_appbar.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      HomeView(),
      const Center(child: Text('Categories')),
      const Center(child: Text('Tags')),
      const Center(child: Text('Authors')),
    ];
    return ChangeNotifierProvider<SplashViewmodel>(
      create: (context) => SplashViewmodel(),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: MyAppBar(),
          body: screen[context.watch<SplashViewmodel>().pageIndex],
          bottomNavigationBar: BottomNavBar(
            pageIndex: context.watch<SplashViewmodel>().pageIndex,
          ),
        ),
      ),
    );
  }
}
