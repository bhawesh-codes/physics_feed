import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:physics_feed/core/theme/app_theme.dart';
import 'package:physics_feed/core/theme/theme_viewmodel.dart';
import 'package:physics_feed/core/utils/app_router.dart';
import 'package:physics_feed/core/utils/service_locator.dart';
import 'package:physics_feed/views/dashboard/dashboard_view.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔹 Initialize Firebase
  await Firebase.initializeApp();

  // 🔹 Capture Flutter framework errors
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  // 🔹 Capture all uncaught async errors

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  setupLocator();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeViewModel(),
      child: Builder(
        builder: (context) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return MaterialApp(
                navigatorKey: AppRouter.navigatorKey,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: context.watch<ThemeViewModel>().themeMode,
                title: 'Physics Feeds',
                home: child,
              );
            },
            child: const DashboardView(), 
          );
        },
      ),
    );
  }
}
