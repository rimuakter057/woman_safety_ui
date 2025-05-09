import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import '../../../../../app/utils/color/app_colors.dart';
import '../../../../../app/utils/sizes/size.dart';
import '../../../../../app/utils/text_style.dart';


class NoteText extends StatelessWidget {
  const NoteText({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(

          height: AppSizes.height(context) * .037,
          width: AppSizes.width(context) * .15,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "মনে রাখবেন",
              style: MyTextStyle.buttonTextStyle.copyWith(
                  fontSize:AppSizes.height(context) * .013,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: AppSizes.height(context) * .05,
            child: Marquee(
              text:
              'নারী বলে অসম্মান করো না| নারীদের সুরক্ষা নিশ্চিত করা আমাদের সবার দায়িত্ব ',
              style: MyTextStyle.buttonTextStyle
                  .copyWith(fontSize: AppSizes.height(context) * .03,color: AppColors.primaryColor),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
        )
      ],
    );
  }
}