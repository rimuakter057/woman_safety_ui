import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../app/utils/color/app_colors.dart';
import '../../../../app/utils/color/gradient_color.dart';
// Import to use Poppins font

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Decoration? decoration;
  final Color? color;
  final Color? textColor;

  const  CustomButton({
    super.key,
    required this.text,
    required this.onPressed, this.decoration, this.color, this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return AnimatedContainer(
        height: MediaQuery.of(context).size.width * 0.12,
      duration: const Duration(milliseconds: 300),
      decoration:decoration?? BoxDecoration(
        borderRadius: BorderRadius.circular(width * 0.02), // responsive
        gradient: AppGradients.buttonGradient,
        boxShadow: [
          BoxShadow(
            color: Colors.indigo.shade400,
            offset: Offset(0, height * 0.01),
            blurRadius: width * 0.03,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(width * 0.08),
          onTap: onPressed,
          splashColor: Colors.white54,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.01,  // approx 14 in 800px height
              horizontal: width * 0.06,  // approx 24 in 400px width
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(color:textColor?? AppColors.white)
            ),
          ),
        ),
      ),
    );
  }
}
