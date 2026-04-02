import 'package:flutter/material.dart';
import 'package:physics_feed/views/splash/splash_viewmodel.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.pageIndex});

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: context.read<SplashViewmodel>().changePageIndex,
      currentIndex: pageIndex,
      backgroundColor: colors.primaryContainer,
      selectedItemColor: colors.onSurface,
      unselectedItemColor: colors.onSurface.withAlpha(150),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.article_outlined),
          label: 'All Articles',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category_outlined),
          label: 'Categories',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.tag), label: 'Tags'),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Authors',
        ),
      ],
    );
  }
}
