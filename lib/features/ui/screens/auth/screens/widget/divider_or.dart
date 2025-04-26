import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../../../../app/utils/color/app_colors.dart';
import '../../../../../../app/utils/sizes/size.dart';

class DividerOr extends StatelessWidget {
  const DividerOr({super.key});

  @override
  Widget build(BuildContext context) {
    final fontSize = AppSizes.width(context) * 0.04; // ≈ 16 for medium screen

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: AppColors.grey,
            thickness: AppSizes.dividerHeight(context),
            endIndent: 12,
          ),
        ),
        Text(
          "or",
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            color: Color(0xFF333333),
          ),
        ),
        Expanded(
          child: Divider(
            color:AppColors.grey,
            thickness: AppSizes.dividerHeight(context),
            indent: 12,
          ),
        ),
      ],
    );
  }
}
