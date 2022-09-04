
import 'package:flutter/material.dart';
import 'package:widgetbook_challenge/core/constants/constants.dart';

/// A class containing the app's theme data
class AppTheme {
  AppTheme._();

  /// A static data for providing an instance of [ThemeData]
  static ThemeData themeData = _themeData(_colorScheme);

  static ThemeData _themeData(ColorScheme colorScheme) => ThemeData(
        colorScheme: colorScheme,
        textTheme: _textTheme,
        backgroundColor: AppColors.primaryColor,
      );

  static final ColorScheme _colorScheme = const ColorScheme.light().copyWith(
    primary: AppColors.primaryColor,
    onBackground: AppColors.white,
    onSurface: AppColors.white,
  );

  static const TextTheme _textTheme = TextTheme(
    bodyText2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    subtitle2: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  );
}
