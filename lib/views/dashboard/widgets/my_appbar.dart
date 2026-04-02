import 'package:flutter/material.dart';
import 'package:physics_feed/core/theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // final themeMode = context.watch<ThemeViewModel>().themeMode;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      title: Text(
        'Physics Feeds',
        style: textTheme.titleLarge?.copyWith(color: colorScheme.onPrimary),
      ),
      actions: [
        IconButton(
          onPressed: context.read<ThemeViewModel>().toggleThemeMode,
          icon: Icon(isDark ? Icons.sunny : Icons.nightlight),
          style: IconButton.styleFrom(foregroundColor: colorScheme.onPrimary),
        ),
      ],
    );
  }
}
