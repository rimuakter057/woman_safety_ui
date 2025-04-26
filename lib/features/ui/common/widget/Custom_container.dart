import 'package:flutter/material.dart';

import '../../../../app/utils/color/app_colors.dart';

/// Custom Container Widget
class CustomContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final double? borderWidth;
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? containerColor;
  final Color? borderColor;
  final Gradient? gradient;
  final List<BoxShadow>? boxShadow;
 final BoxShape? shape;
  /// Individual corner radius
  final double? bottomLeft;
  final double? bottomRight;
  final double? topLeft;
  final double? topRight;

  const CustomContainer({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.margin,
    this.padding,
    this.gradient,
    this.borderRadius,
    this.borderWidth,
    this.containerColor,
    this.borderColor,
    this.bottomLeft,
    this.bottomRight,
    this.topLeft,
    this.topRight,
    this.boxShadow,
 this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        gradient: gradient,
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: borderWidth ?? 0,
        ),
       borderRadius:  shape == BoxShape.circle ? null : _getBorderRadius(),
         color: containerColor ?? AppColors.white,

      ),
      child: child,
    );
  }

  /// boarder radius function

  BorderRadiusGeometry _getBorderRadius() {
    if (borderRadius != null) {
      return borderRadius!;
    }

    if (bottomLeft != null ||
        bottomRight != null ||
        topLeft != null ||
        topRight != null) {
      return BorderRadius.only(
        bottomLeft: Radius.circular(bottomLeft ?? 0),
        bottomRight: Radius.circular(bottomRight ?? 0),
        topLeft: Radius.circular(topLeft ?? 0),
        topRight: Radius.circular(topRight ?? 0),
      );
    }

    return BorderRadius.zero;
  }


}
