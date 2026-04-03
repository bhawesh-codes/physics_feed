import 'package:flutter/material.dart';
import 'package:physics_feed/core/theme/theme_extension.dart';
import 'package:physics_feed/core/theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      title: Text(
        'Physics Feeds',
        style: context.titleLarge?.copyWith(color: context.colors.onPrimary),
      ),
      actions: [
        IconButton(
          onPressed: context.read<ThemeViewModel>().toggleThemeMode,
          icon: Icon(isDark ? Icons.sunny : Icons.nightlight),
          style: IconButton.styleFrom(foregroundColor: context.colors.onPrimary),
        ),
      ],
    );
  }
}
