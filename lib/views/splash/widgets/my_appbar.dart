import 'package:flutter/material.dart';
import 'package:physics_feed/utils/app_theme.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<MyAppTheme>().themeMode;
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      title: Text('Physics Feeds', style: textTheme.titleLarge),
      actions: [
        IconButton(
          onPressed: context.read<MyAppTheme>().toggleThemeMode,
          icon: themeMode == ThemeMode.light
              ? const Icon(Icons.nightlight)
              : const Icon(Icons.sunny),
          style: IconButton.styleFrom(foregroundColor: Colors.white),
        ),
      ],
    );
  }
}
