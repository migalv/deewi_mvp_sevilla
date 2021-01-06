import 'package:flutter/material.dart';

class DeewiTheme {
  final ThemeData base = ThemeData.light();

  ThemeData get themeData => base.copyWith(
        primaryColor: Colors.amber,
        accentColor: Colors.amber,
        colorScheme: ColorScheme(
          primary: Colors.amber,
          primaryVariant: Colors.amber,
          secondary: ThemeData.light().colorScheme.secondary,
          secondaryVariant: ThemeData.light().colorScheme.secondaryVariant,
          background: ThemeData.light().colorScheme.background,
          surface: ThemeData.light().colorScheme.surface,
          error: ThemeData.light().errorColor,
          onPrimary: ThemeData.light().colorScheme.onPrimary,
          onSecondary: ThemeData.light().colorScheme.onSecondary,
          onBackground: ThemeData.light().colorScheme.onBackground,
          onSurface: ThemeData.light().colorScheme.onSurface,
          onError: ThemeData.light().colorScheme.onError,
          brightness: ThemeData.light().colorScheme.brightness,
        ),
        buttonTheme: ButtonThemeData(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          buttonColor: Colors.amber,
        ),
      );
}
