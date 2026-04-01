import 'package:flutter/material.dart';

class MyAppTheme extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  static final kColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blueAccent,
  );

  static final kDarkColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.black,
    brightness: Brightness.dark,
  );

  static final lightTheme =
      ThemeData.from(colorScheme: kColorScheme, useMaterial3: true).copyWith(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: kColorScheme.primary,
          foregroundColor: kColorScheme.onPrimary,
        ),
        listTileTheme: ListTileThemeData(
          iconColor: kColorScheme.onSurface,
          textColor: kColorScheme.onSurface,
        ),
        scaffoldBackgroundColor: kColorScheme.surface,
        textTheme: ThemeData.from(colorScheme: kColorScheme).textTheme.copyWith(
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      );

  static final darkTheme = ThemeData.from(colorScheme: kDarkColorScheme)
      .copyWith(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.onPrimary,
        ),
        listTileTheme: ListTileThemeData(
          iconColor: kDarkColorScheme.onSurface,
          textColor: kDarkColorScheme.onSurface,
        ),
        textTheme: TextTheme().copyWith(
          titleLarge: TextStyle(
            color: kDarkColorScheme.onSurface,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: kDarkColorScheme.onSurface,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            color: kDarkColorScheme.onSurface,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          bodySmall: TextStyle(
            color: kDarkColorScheme.onSurface,
            fontSize: 10,
            fontWeight: FontWeight.normal,
          ),
        ),
        scaffoldBackgroundColor: kDarkColorScheme.surface,
      );
  void toggleThemeMode() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
