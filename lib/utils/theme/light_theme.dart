import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/utils/app_colors.dart';

class LightTheme {
  static final ThemeData ligthTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColors.transparent,
      ),
    ),
    primaryColor: AppColors.black,
    disabledColor: AppColors.black.withOpacity(0.4),
    dividerColor: AppColors.black,
    canvasColor: const Color(0xFFFFFFFF),
    iconTheme: IconThemeData(
      color: AppColors.black,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(fontSize: 16.sp, fontFamily: "Lato", fontWeight: FontWeight.w500, color: AppColors.black),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.c9741CC,
      foregroundColor: AppColors.white,
    ),
    cardTheme: const CardTheme(color: Color(0xFFC4E3F7)),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 57.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      displayMedium: TextStyle(
        fontSize: 45.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      displaySmall: TextStyle(
        fontSize: 36.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      headlineLarge: TextStyle(
        fontSize: 32.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      headlineMedium: TextStyle(
        fontSize: 28.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      headlineSmall: TextStyle(
        fontSize: 24.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      titleLarge: TextStyle(
        fontSize: 22.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      labelLarge: TextStyle(
        fontSize: 14.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      labelMedium: TextStyle(
        fontSize: 12.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      labelSmall: TextStyle(
        fontSize: 11.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
    ),
  );
}
