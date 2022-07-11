import 'package:flutter/material.dart';

class RPCTheme {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: ThemeData.light().colorScheme.copyWith(
          secondary: Colors.deepPurpleAccent,
          primary: Colors.deepPurple,
        ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
      ),
    ),
    textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Inter'),
  );
}
