/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/call_controller.dart';
import '../../../utils/color.dart';
import '../../../utils/text_style.dart';

class CallServices extends StatelessWidget {
  const CallServices({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final getData = Get.put(CallController());
    return Column(children: [
      Container(
        height : size.height*.1,
        width: size.width*.18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.whiteColor,
        ),
        child: Center(child: Icon(Icons.safety_check,color: AppColors.blueColor,size:size.height*.08,)),
      ),
      SizedBox(height: size.height*.01,),
      Text("h",style: MyTextStyle.commonTextStyle,),
    ],);
  }
}*/
