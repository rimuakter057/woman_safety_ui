
import 'package:flutter/material.dart';

import '../../../../app/utils/color/app_colors.dart';
import '../../../../app/utils/sizes/size.dart';



class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,

    this.onTap,
    this.iconColor,
    this.iconSize,
  });


  final void Function()? onTap;
  final Color? iconColor;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        Icons.arrow_back,
        color: iconColor ?? AppColors.white,
        size: iconSize ?? AppSizes.iconMd(context),
      ),
    );
  }
}
