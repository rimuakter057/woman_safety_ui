

import 'package:flutter/material.dart';

import '../../color/app_colors.dart';


class AppChipTheme{
  AppChipTheme ._();

  static ChipThemeData lightChipThemeData = ChipThemeData(
    disabledColor: AppColors.grey.withOpacity(0.4),
    labelStyle: TextStyle(
      color: AppColors.black,
    ),
    selectedColor: Colors.blue,
    padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
checkmarkColor: AppColors.white
  );

  static ChipThemeData darkChipThemeData = ChipThemeData(
      disabledColor: AppColors.grey,
      labelStyle: TextStyle(
        color: AppColors.white,
      ),
      selectedColor: Colors.blue,
      padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
      checkmarkColor: AppColors.white
  );

}