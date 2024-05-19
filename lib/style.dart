import 'package:flutter/material.dart';

class AppColors {
  static const darkGrey = Color(0xFF635C5C);
  static const darkBlue = Color(0xFF0B6EFE);
  static const hijauGelap = Color(0xFF6DC1B4);
}

class TextStyles {
  static TextStyle title = const TextStyle(
      fontFamily: 'Schyler',
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
      color: AppColors.darkGrey);

  static TextStyle body = const TextStyle(
      fontFamily: 'Schyler',
      fontWeight: FontWeight.normal,
      fontSize: 16.0,
      color: AppColors.darkGrey);

  static TextStyle warna = const TextStyle(
      fontFamily: 'Schyler',
      fontWeight: FontWeight.normal,
      fontSize: 16.0,
      color: AppColors.hijauGelap);
}
