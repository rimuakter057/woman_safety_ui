
import 'package:flutter/material.dart';


import '../../../../app/utils/color/app_colors.dart';

import '../../../../app/utils/sizes/size.dart';



class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? shadowColor;
  final Color? color;
  const CustomCard({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.shadowColor, this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color:color ?? AppColors.white,
      elevation: 3,
      shadowColor: shadowColor ?? AppColors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.borderRadiusSm(context),
        ), // গোল কোণা
      ),
      child: child,
    );
  }
}
