import 'package:flutter/material.dart';
import 'package:physics_feed/utils/app_theme.dart';
import 'package:physics_feed/views/splash/splash_view.dart';
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
  create: (_) => MyAppTheme(),
  child: Builder(
    builder: (context) {
      return MaterialApp(
        theme: MyAppTheme.lightTheme,
        darkTheme: MyAppTheme.darkTheme,
      themeMode: context.watch<MyAppTheme>().themeMode,
        title: 'Physics Feeds',
        home: const SplashView(),
      );
    },
  ),
);
}
}
