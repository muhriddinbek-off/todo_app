import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/utils/app_colors.dart';

class DarkTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.c121212,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.c121212,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        statusBarColor: AppColors.transparent,
      ),
    ),
    primaryColor: AppColors.aFAFAF,
    disabledColor: AppColors.white,
    dividerColor: AppColors.white,
    canvasColor: const Color(0xFF272727),
    iconTheme: IconThemeData(
      color: AppColors.white,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(fontSize: 16.sp, fontFamily: "Lato", fontWeight: FontWeight.w500, color: AppColors.white.withOpacity(0.44)),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.c9741CC,
      foregroundColor: AppColors.white,
    ),
    cardTheme: CardTheme(color: AppColors.c363636),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 57.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      displayMedium: TextStyle(
        fontSize: 45.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      displaySmall: TextStyle(
        fontSize: 36.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      headlineLarge: TextStyle(
        fontSize: 32.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      headlineMedium: TextStyle(
        fontSize: 28.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      headlineSmall: TextStyle(
        fontSize: 24.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      titleLarge: TextStyle(
        fontSize: 22.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      labelLarge: TextStyle(
        fontSize: 14.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      labelMedium: TextStyle(
        fontSize: 12.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      labelSmall: TextStyle(
        fontSize: 11.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
        fontFamily: "Lato",
      ),
    ),
  );
}
