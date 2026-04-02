import 'package:flutter/material.dart';
import 'package:physics_feed/core/theme/app_theme.dart';
import 'package:physics_feed/core/theme/theme_viewmodel.dart';
import 'package:physics_feed/views/dashboard/dashboard_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeViewModel(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: context.watch<ThemeViewModel>().themeMode,
            title: 'Physics Feeds',
            home: const DashboardView(),
          );
        },
      ),
    );
  }
}
