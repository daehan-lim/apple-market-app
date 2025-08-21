import 'package:flutter/material.dart';

import 'constants/app_colors.dart';

class AppTheme {
  static ThemeData buildTheme({Brightness brightness = Brightness.light}) {
    return ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: AppColors.appBarBg),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          textStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
