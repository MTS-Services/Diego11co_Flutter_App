import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
    textTheme: _textTheme(),
    inputDecorationTheme: _inputDecorationTheme(),
    elevatedButtonTheme: _elevatedButtonThemeData()
  );
}

ElevatedButtonThemeData _elevatedButtonThemeData() {
  return ElevatedButtonThemeData(
    style:ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textFieldColor,
      elevation: 0
    ),
  );
}

InputDecorationTheme _inputDecorationTheme() {
  return InputDecorationTheme(
    border: OutlineInputBorder(borderSide: BorderSide.none),
    fillColor: AppColors.textFieldColor,
    filled: true,
    contentPadding: EdgeInsets.all(8),
  );
}

TextTheme _textTheme() {
  return const TextTheme(
    bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  );
}
