import 'package:flutter/material.dart';
import '../../../../../../app/utils/color/app_colors.dart';
import '../../../../../../app/utils/sizes/size.dart';



class HeaderContainer extends StatelessWidget {
  const HeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = AppSizes.height(context) * 0.19; // approx 155
    final double iconSize = AppSizes.width(context) * 0.06; // approx 24
    final double fontSize = AppSizes.fontSizeMd(context); // approx 16

    return Container(
      height: height,
      width: AppSizes.width(context),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.width(context) * 0.05,
        vertical: AppSizes.height(context) * 0.03,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_back,
            size: iconSize,
            color: Colors.white,
          ),
          SizedBox(width: AppSizes.width(context) * 0.03),
          Text(
            'Your Text Here',
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

