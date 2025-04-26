import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../app/utils/color/app_colors.dart';



// Custom ListTile Widget
class CustomListTile extends StatelessWidget {
  final String title;
  final IconData? leadingIcon;
  final VoidCallback? onTap;
  final Color? leadingIconColor;
  final String? subtitle;
  final Widget? trailing;
  final TextStyle? titleStyle;
  final Widget? leading;
  final TextStyle?titleTextStyle;
  final TextStyle?subtitleTextStyle;
  const CustomListTile({
    super.key,
   required this.title,
    this.subtitle,
    this.leadingIcon,
    this.onTap,
    this.leadingIconColor,
    this.trailing,
    this.titleStyle,
    this.leading, this.titleTextStyle, this.subtitleTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity(horizontal: -4), // Horizontal space কমাবে
      minLeadingWidth: 0,
      leading: leading ,
      title: Text(
        title,style:titleTextStyle?? Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.white),

      ),
      subtitle:Text(subtitle??" ",style:subtitleTextStyle??Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.white),),
           trailing: trailing,
      onTap: onTap,
    );
  }
}










/*


class CustomListTile extends StatelessWidget {
  final String title;
  final String time;
  final String imageAssetPath;

  const CustomListTile({
    super.key,
    required this.title,
    required this.time,
    required this.imageAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Leading Image
        Container(
          height: MediaQuery.of(context).size.width * 0.15,
          width: MediaQuery.of(context).size.width * 0.15,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imageAssetPath,
              fit: BoxFit.cover,
              color: AppColors.white,
            ),
          ),
        ),
        SizedBox(width: 12),
        // Title and Time
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: AppSizes.fontSizeMd(context),
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              // Time
              Text(
                time,
                style: GoogleFonts.poppins(
                  fontSize: AppSizes.fontSizeMd(context) * 0.9,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
*/
