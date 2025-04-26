import 'package:flutter/material.dart';

class AppSizes {
  ///screen size
  static double width(BuildContext context) => MediaQuery.of(context).size.width;
  static double height(BuildContext context) => MediaQuery.of(context).size.height;

  static double defaultPadding(BuildContext context) => width(context)* 0.04;


  ///main screen body section
  static double containerHeightLg(BuildContext context) =>height (context) *  0.22;
  static double opCoHeight(BuildContext context) => width(context) *  0.2;
  static double containerHeightMd(BuildContext context) => width(context) *  0.3;
  static double containerHeightXMd(BuildContext context) => width(context) *  0.15;
  static double containerHeightSm(BuildContext context) => width(context)*  0.1;
  static double containerWidthSm(BuildContext context) => width(context) *  0.3;

  ///border radius
  static double borderRadiusSm(BuildContext context) => width(context) * 0.018;


  // Icon sizes
  static double iconMd(BuildContext context) => width(context) * 0.06;
  static double iconSm(BuildContext context) => width(context) * 0.04;

  /// Font sizes
  static double fontSizeSm(BuildContext context) => width(context) * 0.03;
  static double fontSizeMd(BuildContext context) => width(context) * 0.035;
  static double fontSizeLg(BuildContext context) => width(context)* 0.057;
  static double appbarText(BuildContext context) => width(context)* 0.055;


  /// Default spacing

  static double spaceBthItems(BuildContext context) => height (context)* 0.018;
  static double spaceBthSections(BuildContext context) => height (context)* 0.04;
  static double spaceBtwItems(BuildContext context) => width(context)* 0.018;
  static double spaceWTwoItems(BuildContext context) => width(context)* 0.08;
  static double sideSpace (BuildContext context) => height (context)* 0.12;
  static double smallHSpace(BuildContext context) => height (context) * 0.005;

  /// Divider height
  static double dividerHeight(BuildContext context) => height (context) * 0.001;

}