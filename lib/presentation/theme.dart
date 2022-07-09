import 'package:flutter/material.dart';

import '../utils/constants.dart';

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
      titleTextStyle: const TextStyle(color: Colors.black, fontSize: 28),
    ),
    colorScheme: ColorScheme.light(
      primary: _primarySwatchColors[500]!,
      secondary: _primarySwatchColors[700]!,
      primaryContainer: _primarySwatchColors[100]!,
      secondaryContainer: _primarySwatchColors[100]!,
      error: PColors.error,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 128,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
        color: _primarySwatchColors[800]!,
      ),
      headline2: TextStyle(
        fontSize: 64,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
        color: _primarySwatchColors[800]!,
      ),
      headline3: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
        color: _primarySwatchColors[800]!,
      ),
      headline4: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
        color: _primarySwatchColors[800]!,
      ),
      headline5: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
        color: _primarySwatchColors[800]!,
      ),
      headline6: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
      ),
      bodyText1: const TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.bold,
      ),
      bodyText2: const TextStyle(
        fontSize: 14,
        fontFamily: 'Inter',
      ),
      button: const TextStyle(
        fontSize: 14,
        fontFamily: 'Inter',
      ),
      caption: const TextStyle(
        fontSize: 12,
        fontFamily: 'Inter',
      ),
      overline: const TextStyle(
        fontSize: 10,
        fontFamily: 'Inter',
      ),
    ),
  );
}
