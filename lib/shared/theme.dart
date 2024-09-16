import 'package:chat_rome_app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ApplicationTheme {
  static ThemeData themeLight = ThemeData(
      // scaffoldBackgroundColor: AppColors.transparent,
      textTheme: const TextTheme(
          bodyLarge:  TextStyle(
            fontSize: 25,
            color: AppColors.blue,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            fontSize: 20,
           
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
