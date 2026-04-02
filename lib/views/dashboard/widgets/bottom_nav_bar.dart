import 'package:flutter/material.dart';
import 'package:physics_feed/views/dashboard/dashboard_viewmodel.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.pageIndex});

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: pageIndex,
      onTap: context.read<DashboardViewmodel>().changePageIndex,
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
