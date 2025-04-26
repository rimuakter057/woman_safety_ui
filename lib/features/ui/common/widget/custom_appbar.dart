import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woman_safety_ui/features/ui/screens/main_nav_screen/main_nav_screen.dart';

import '../../../../app/utils/color/app_colors.dart';
import '../../../../app/utils/text_style.dart';

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
    bool isMainNavScreen = Get.currentRoute == MainNavScreen.name;
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
