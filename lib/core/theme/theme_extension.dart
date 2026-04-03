import 'package:flutter/material.dart';

extension ThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => Theme.of(this).colorScheme;
  TextTheme get textStyle => Theme.of(this).textTheme;

  
  Color get primaryColor => colors.primary;
  Color get surfaceColor => colors.surface;
  TextStyle? get titleLarge => textStyle.titleLarge;
  TextStyle? get bodyMedium => textStyle.bodyMedium;
}

