// lib/widgets/top_header_container.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../app/utils/color/app_colors.dart';
import '../../../../../../app/utils/color/gradient_color.dart';


class SignHeaderContainer extends StatelessWidget {
  const SignHeaderContainer({super.key, this.title, this.subtitle});

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final headerHeight = screenHeight * 0.3;
    final containerRadius = screenWidth * 0.05;
    final titleFontSize = screenWidth * 0.06;
    final subtitleFontSize = screenWidth * 0.035;
    final bottomSpacing = screenHeight * 0.06;

    return Container(
      width: double.infinity,
      height: headerHeight,
      decoration: BoxDecoration(
        gradient: AppGradients.buttonGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(containerRadius),
          bottomRight: Radius.circular(containerRadius),
        ),
      ),
      child: Stack(
        children: [

          Positioned(
            bottom: bottomSpacing,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title??
                  'Welcome Back!',
                  style: GoogleFonts.poppins(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(subtitle??
                  'Sign in to continue',
                  style: GoogleFonts.poppins(
                    fontSize: subtitleFontSize,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
