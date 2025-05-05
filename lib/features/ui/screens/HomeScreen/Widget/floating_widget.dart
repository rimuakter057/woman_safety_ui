import 'package:flutter/material.dart';

import '../../../../../app/utils/color/app_colors.dart';
import '../../../../../app/utils/sizes/size.dart';
import '../../../../../app/utils/text_style.dart';



class FloatingWidget extends StatelessWidget {
  const FloatingWidget({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.width(context) * .1,
      width: AppSizes.width(context) * .3,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        color: AppColors.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "প্রশ্ন করুন?",
          style: MyTextStyle.commonTextStyle,
        ),
      ),
    );
  }
}