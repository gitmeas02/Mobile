import 'package:flutter/material.dart';
import 'package:tp4_flutter/theme/colors.dart';

class AppTheme extends AppColors{
  static final defaultColor = ThemeData().copyWith(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
    ),
  );
}