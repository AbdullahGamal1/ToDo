import 'package:flutter/material.dart';
import 'package:to_do_app/UI/theme/app_colors.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.accentColor,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          titleTextStyle: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          elevation: 0),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.hintColor,
          showUnselectedLabels: false,
          showSelectedLabels: false),
      textTheme: TextTheme(
          bodyMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.hintColor) //todo:this for item title
          ,
          titleMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor),
          bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: AppColors.hintColor) //todo: for discription
          ));
}
