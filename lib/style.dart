import 'package:flutter/material.dart';

class AppColors {
  static const darkGrey = Color(0xFF635C5C);
  static const darkBlue = Color.fromARGB(255, 158, 207, 230);
  static const hijauGelap = Color(0xFF6DC1B4);
  static const putihCerah = Color(0xFFFFFFFF);
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
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
      color: AppColors.hijauGelap);
  static TextStyle titleForm = const TextStyle(
      fontFamily: 'Schyler',
      fontWeight: FontWeight.w500,
      fontSize: 28.0,
      color: AppColors.hijauGelap);
  static TextStyle titleApp = const TextStyle(
      fontFamily: 'Schyler',
      fontWeight: FontWeight.w500,
      fontSize: 28.0,
      color: AppColors.putihCerah);
}
