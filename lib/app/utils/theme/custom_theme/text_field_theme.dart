import 'package:flutter/material.dart';
import '../../color/app_colors.dart';

class AppTextFormFieldTheme {
  AppTextFormFieldTheme._();

  // Light Theme
  static InputDecorationTheme lightInputDecorationTheme(BuildContext context) {


    return InputDecorationTheme(
      fillColor: AppColors.filled,
      filled: true,
      errorMaxLines: 3,
      prefixIconColor: AppColors.grey,
      suffixIconColor: AppColors.grey,

      // Same Style for Label and Hint Text
      labelStyle: Theme.of(context).textTheme.titleSmall,
      hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color:AppColors.grey ),
      errorStyle: TextStyle(
        fontWeight: FontWeight.normal,
        color: Colors.red, // Error color
      ),

      // Set default border styles here
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color:Color(0xFFDEDEDE)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color:Color(0xFFDEDEDE)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: Colors.black12),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 2, color: AppColors.pink),
      ),
    );
  }

  // Dark Theme
  static InputDecorationTheme darkInputDecorationTheme(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth * 0.04; // ~16 on average screen size

    return InputDecorationTheme(
      errorMaxLines: 3,
      prefixIconColor: AppColors.grey,
      suffixIconColor: AppColors.grey,

      // Same Style for Label and Hint Text
      labelStyle: TextStyle(
        fontSize: fontSize, // Responsive font size based on screen width
        color: Colors.white, // White for dark mode
        fontWeight: FontWeight.w600, // Semi-bold label text
        fontFamily: 'Poppins', // Poppins font
      ),
      hintStyle: TextStyle(
        fontSize: fontSize, // Same font size for hint text
        fontWeight: FontWeight.normal, // Regular weight for hint text
        color: Color(0xFF767676), // Grey color for hint text
        fontFamily: 'Poppins', // Poppins font
      ),
      errorStyle: TextStyle(
        fontWeight: FontWeight.normal,
        color: Colors.red, // Error color
      ),

      // Set default border styles here for dark theme
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: AppColors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: AppColors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: Colors.white),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 2, color: Colors.orange),
      ),
    );
  }
}
