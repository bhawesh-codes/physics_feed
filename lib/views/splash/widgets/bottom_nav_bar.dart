import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
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
