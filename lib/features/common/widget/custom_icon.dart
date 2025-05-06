
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/utils/color/app_colors.dart';
import '../../../../app/utils/sizes/size.dart';



class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,


    this.iconColor,
    this.iconSize,
  });



  final Color? iconColor;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Icon(
        Icons.arrow_back,
        color: iconColor ?? AppColors.white,
        size: iconSize ?? AppSizes.iconMd(context),
      ),
    );
  }
}
