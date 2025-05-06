import 'package:flutter/material.dart';

import '../../../../../app/utils/sizes/size.dart';


class HeaderImage extends StatelessWidget {
  const HeaderImage({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.height(context)* .2,
      width: AppSizes.width(context),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/slide/slide_three.jpg",
              ),
              fit: BoxFit.cover)),
    );
  }
}