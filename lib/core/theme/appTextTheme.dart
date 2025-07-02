import 'package:flutter/material.dart';

class AppTextTheme {
  static const TextStyle header =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

  static const TextStyle bodyText =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w500);

  static const TextStyle bodyText2 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w400);

  static TextTheme textTheme = TextTheme(
      headlineLarge: header, bodyMedium: bodyText, bodySmall: bodyText2);
}
