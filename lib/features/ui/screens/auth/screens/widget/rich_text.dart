import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../../../../app/utils/color/app_colors.dart';
import '../../../../../../app/utils/sizes/size.dart';

class RichTextWidget extends StatelessWidget {
  final String normalText;
  final String actionText;
  final VoidCallback onTap;

  const RichTextWidget({
    super.key,
    required this.normalText,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: normalText,
        style: GoogleFonts.poppins(
          fontSize: AppSizes.width(context)*0.040,
          fontWeight: FontWeight.w400, // regular
          color: const Color(0xFFA1A1A1),
        ),
        children: [
          TextSpan(
            text: actionText,
            style: GoogleFonts.poppins(
              fontSize:AppSizes.width(context)*0.040,
              fontWeight: FontWeight.w500, // medium
              color: AppColors.primaryColor,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
