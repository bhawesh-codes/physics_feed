import 'package:flutter/material.dart';
import 'package:physics_feed/utils/app_theme.dart';
import 'package:physics_feed/views/home/home_view.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    var themeMode = context.watch<MyAppTheme>().themeMode;
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Physics Feeds', style: textTheme.titleLarge),
        actions: [
          IconButton(
            onPressed: context.read<MyAppTheme>().toggleThemeMode,
            icon: themeMode == ThemeMode.light
                ? Icon(Icons.nightlight)
                : Icon(Icons.sunny),
            style: IconButton.styleFrom(foregroundColor: Colors.white),
          ),
        ],
      ),

      body: const HomeView(),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        backgroundColor: colors.primaryContainer,
        selectedItemColor: colors.onSurface,
        unselectedItemColor: colors.onSurface.withAlpha(150),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'All Articles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.tag), label: "Tags"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Authors",
          ),
        ],
      ),
    );
  }
}
