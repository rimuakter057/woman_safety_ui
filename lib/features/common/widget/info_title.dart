import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../app/asset_path.dart';
import '../../../../app/utils/color/app_colors.dart';


class InfoTitle extends StatelessWidget {
  final String title;
  final String? time;
  final String? iconPath;
 final Widget?trailingWidget;
  final Widget?titleWidget;
  final Widget?leadingWidget;
  final Color? color;
  const InfoTitle({
    super.key,
    required this.title,
  this.time,
 this.iconPath, this.trailingWidget, this.titleWidget, this.leadingWidget, this.color,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Container(
      height: height * 0.095, // ~76
      width: width * 0.95, // ~364
      decoration: BoxDecoration(
        color:color?? AppColors.white,
        border: Border.all(color: const Color(0xFFE8E8E8), width: width * 0.0028),
        borderRadius: BorderRadius.circular(width * 0.022), // ~8
      ),
      child: Padding(
        padding: EdgeInsets.all(width * 0.025), // ~9
        child: Row(
          children: [
            Container(
              height: width * 0.16, // ~58
              width: width * 0.16,
              decoration: BoxDecoration(
                color: const Color(0xFF2D7F8D),
                borderRadius: BorderRadius.circular(width * 0.022),
              ),
              child: Center(
                child: Image.asset(
                  iconPath?? AssetImages.appbarIcon,
                  height: width * 0.11, // ~40
                  width: width * 0.11,
                ),
              ),
            ),
            SizedBox(width: width * 0.044), // ~16
            Expanded(
              child:titleWidget?? Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: width * 0.044, // ~16
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
           trailingWidget?? Text(
              time??"",
              style: GoogleFonts.poppins(
                fontSize: width * 0.044, // ~16
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          //  SizedBox(width: width * 0.05), // ~18
          ],
        ),
      ),
    );
  }
}
