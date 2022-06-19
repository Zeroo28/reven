import 'package:flutter/material.dart';

class RPCTheme {
  static const Map<int, Color> _primarySwatchColors = {
    50: Color(0xFFF5F5F5),
    100: Color(0xFFEEEEEE),
    200: Color(0xFFE0E0E0),
    300: Color(0xFFBDBDBD),
    400: Color(0xFF9E9E9E),
    500: Color(0xFF757575),
    600: Color(0xFF616161),
    700: Color(0xFF424242),
    800: Color(0xFF212121),
    900: Color(0xFF000000),
  };

  static final ThemeData lightTheme = ThemeData(
      primarySwatch: const MaterialColor(0xFFFFFFFF, _primarySwatchColors),
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: _primarySwatchColors[50],
      appBarTheme: AppBarTheme(
        backgroundColor: _primarySwatchColors[50],
        elevation: 0,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 32),
      ),
      colorScheme: ColorScheme.light(
        primary: const Color(0xFFdfe7e7),
        primaryContainer: _primarySwatchColors[100]!,
        secondary: _primarySwatchColors[700]!,
        secondaryContainer: _primarySwatchColors[100]!,
        error: const Color(0xFFeb5757),
        onPrimary: Colors.black,
        onSecondary: Colors.white,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.white,
        brightness: Brightness.light,
      ),
      textTheme: const TextTheme(
        headline6: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodyText1: TextStyle(
          fontSize: 16,
        ),
      ),
      buttonTheme: const ButtonThemeData(splashColor: Colors.transparent));
}
