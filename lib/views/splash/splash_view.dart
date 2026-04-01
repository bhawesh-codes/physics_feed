import 'package:flutter/material.dart';
import 'package:physics_feed/views/home/home_view.dart';
import 'package:physics_feed/views/splash/widgets/bottom_nav_bar.dart';
import 'package:physics_feed/views/splash/widgets/my_appbar.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: HomeView(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
