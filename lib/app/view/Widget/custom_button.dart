import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/text_style.dart';

class CustomButton extends StatelessWidget {
  final Size size;
  final String name;
  const CustomButton({
    super.key,
    required this.size, required this.name,
  });



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height*.05,
      child: ElevatedButton(onPressed: (){},
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.blueColor,
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        child: Text(name,style: MyTextStyle.buttonTextStyle,),
      ),
    );
  }
}