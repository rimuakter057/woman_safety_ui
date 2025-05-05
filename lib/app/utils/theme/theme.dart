
import 'package:flutter/material.dart';
import 'package:woman_safety_ui/app/utils/color/app_colors.dart';

import 'custom_theme/appbar_theme.dart';
import 'custom_theme/bottom_sheet_theme.dart';
import 'custom_theme/check_box_theme.dart';
import 'custom_theme/chip_theme.dart';
import 'custom_theme/elevated_button_theme.dart';
import 'custom_theme/outlined_button_theme.dart';
import 'custom_theme/text_field_theme.dart';
import 'custom_theme/text_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
     // primaryColor: Colors.blue,
    scaffoldBackgroundColor: AppColors.background,
    textTheme: AppTextTheme.lightTextTheme(context),
   // elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonThemeData,
   // outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonThemeData,
   // checkboxTheme: AppCheckBoxTheme.lightCheckBoxTheme,
   // bottomSheetTheme: AppBottomSheetTheme.lightBottomSheetTheme,
   // chipTheme: AppChipTheme.lightChipThemeData,
   // appBarTheme: MyAppBarTheme.lightAppBarTheme,
    inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme(context),

  );











/*  static ThemeData darkTheme (BuildContext context) => ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
      textTheme: AppTextTheme.lightTextTheme(context),
      elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonThemeData,
      outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonThemeData,
      checkboxTheme: AppCheckBoxTheme.darkCheckBoxTheme,
      bottomSheetTheme: AppBottomSheetTheme.darkBottomSheetTheme,
      chipTheme: AppChipTheme.darkChipThemeData,
      appBarTheme: MyAppBarTheme.darkAppBarTheme,
      inputDecorationTheme: AppTextFormFieldTheme.darkInputDecorationTheme(context)
  );*/
}
