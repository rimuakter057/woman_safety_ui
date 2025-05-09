import 'package:flutter/material.dart';

import '../../../../../app/asset_path.dart';
import '../../../../../app/utils/sizes/size.dart';
import '../../common/widget/profile_image.dart';





class ProfileWidget extends StatelessWidget {

  final String ?name;
  final String? subtitle;

  const ProfileWidget({
    super.key,
     this.subtitle, this.name,
  });

  @override
  Widget build(BuildContext context) {
      final cardHeight = AppSizes.width(context) * 0.5;
    final cardWidth = AppSizes.width(context) * 0.4;

    final fontSizeName = AppSizes.width(context)* 0.045;
    final fontSizeSubtitle =AppSizes.width(context) * 0.035;

    return SizedBox(
      height: cardHeight,
      width: cardWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile Image
          ProfileImage(size: AppSizes.width(context) * 0.3, image: AssetImages.profileImage,),

          SizedBox(height:AppSizes.width(context)  * 0.05),

          // Name
          Text(
            name??"RIMU",
            style: TextStyle(
              fontSize: fontSizeName,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Subtitle
          Text(
            subtitle??"App Developer",
            style: TextStyle(
              fontSize: fontSizeSubtitle,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}


