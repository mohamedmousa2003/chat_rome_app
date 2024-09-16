import 'package:chat_rome_app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ApplicationTheme {
  static ThemeData themeLight = ThemeData(
      scaffoldBackgroundColor: AppColors.transparent,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.white),
      ),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 25,
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            fontSize: 22,
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(
            fontSize: 18,
            
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            
            fontSize: 20,
          )
          ));
}
