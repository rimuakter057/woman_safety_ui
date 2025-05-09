import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/utils/color/app_colors.dart';
import '../../../../app/utils/text_style.dart';
import '../../main_nav_screen/main_nav_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onBackPressed;
  final Widget? leadingWidget;

  const CustomAppBar({super.key,
    required this.title,
    this.onBackPressed, this.leadingWidget,
  });

  @override
  Widget build(BuildContext context) {
   return AppBar(
      backgroundColor: AppColors.primaryColor, // Primary Color
      leading:leadingWidget ,
      centerTitle: true,
      title: Text(
        title,
        style: MyTextStyle.buttonTextStyle, // your custom text style
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // default AppBar height
}
