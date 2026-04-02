import 'package:flutter/material.dart';

class AppTheme {
  // 🔹 Light Color Scheme
  static final ColorScheme _lightColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blueAccent,
  );

  // 🔹 Dark Color Scheme (same seed, proper dark mode)
  static final ColorScheme _darkColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blueAccent,
    brightness: Brightness.dark,
  );

  // 🔹 Public Themes
  static final ThemeData lightTheme = _buildTheme(_lightColorScheme);
  static final ThemeData darkTheme = _buildTheme(_darkColorScheme);

  // 🔥 Common Theme Builder
  static ThemeData _buildTheme(ColorScheme scheme) {
    final base = ThemeData.from(colorScheme: scheme, useMaterial3: true);

    return base.copyWith(
      scaffoldBackgroundColor: scheme.surface,

      // ✅ AppBar Theme (no hardcoded colors)
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        iconTheme: IconThemeData(color: scheme.onPrimary),
      ),

      // ✅ ListTile Theme
      listTileTheme: ListTileThemeData(
        iconColor: scheme.onSurface,
        textColor: scheme.onSurface,
      ),

      // ✅ Text Theme (consistent for both modes)
      textTheme: base.textTheme.copyWith(
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: scheme.onSurface,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: scheme.onSurface,
        ),
        bodyMedium: TextStyle(fontSize: 14, color: scheme.onSurface),
        bodySmall: const TextStyle(fontSize: 12),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: scheme.primaryContainer,
        selectedItemColor: scheme.onSurface,
        unselectedItemColor: scheme.onSurface.withAlpha(155),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
