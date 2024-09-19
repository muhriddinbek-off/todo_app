import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/utils/export_link.dart';

class DarkTheme {
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.c121212,
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
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF9ECBFA),
      surfaceTint: Color(0xFF9ECBFA),
      onPrimary: Color(0xFF003355),
      primaryContainer: Color(0xFF003457),
      onPrimaryContainer: Color(0xFF98C4F3),
      secondary: Color(0xFFCBCC65),
      onSecondary: Color(0xFF323200),
      secondaryContainer: Color(0xFF78791A),
      onSecondaryContainer: Color(0xFFFFFFFF),
      tertiary: Color(0xFFFFFFFF),
      onTertiary: Color(0xFF193800),
      tertiaryContainer: Color(0xFF7FEF00),
      onTertiaryContainer: Color(0xFF224800),
      error: Color(0xFFFFC773),
      onError: Color(0xFF442B00),
      errorContainer: Color(0xFFE19900),
      onErrorContainer: Color(0xFF2A1900),
      surface: Color(0xFF141313),
      onSurface: Color(0xFFE5E2E1),
      onSurfaceVariant: Color(0xFFC2C7CF),
      outline: Color(0xFF8C9199),
      outlineVariant: Color(0xFF42474E),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFE5E2E1),
      inversePrimary: Color(0xFF33628C),
      primaryFixed: Color(0xFFCFE5FF),
      onPrimaryFixed: Color(0xFF001D34),
      primaryFixedDim: Color(0xFF9ECBFA),
      onPrimaryFixedVariant: Color(0xFF154A72),
      secondaryFixed: Color(0xFFE7E87E),
      onSecondaryFixed: Color(0xFF1C1D00),
      secondaryFixedDim: Color(0xFFCBCC65),
      onSecondaryFixedVariant: Color(0xFF494900),
      tertiaryFixed: Color(0xFF89FE0A),
      onTertiaryFixed: Color(0xFF0C2000),
      tertiaryFixedDim: Color(0xFF77DF00),
      onTertiaryFixedVariant: Color(0xFF275000),
      surfaceDim: Color(0xFF141313),
      surfaceBright: Color(0xFF3A3939),
      surfaceContainerLowest: Color(0xFF0E0E0E),
      surfaceContainerLow: Color(0xFF1C1B1B),
      surfaceContainer: Color(0xFF201F1F),
      surfaceContainerHigh: Color(0xFF2A2A2A),
      surfaceContainerHighest: Color(0xFF353434),
    ),
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
