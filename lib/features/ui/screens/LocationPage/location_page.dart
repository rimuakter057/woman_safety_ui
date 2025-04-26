/*
import 'package:flutter/material.dart';
import 'package:woman_safety_ui/app/utils/color.dart';
import 'package:woman_safety_ui/app/utils/icon_url.dart';

import '../../../../app/utils/color/app_colors.dart';
import '../../common/Widget/custom_button.dart';


class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final gap = SizedBox(height: size.height*.02,);
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          SizedBox(height: size.height*.3,),
          Expanded(
            child: Card(
              elevation: 5,
                semanticContainer: false,
                shadowColor: AppColors.blue,
                color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: SizedBox(
                width:  size.width,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){},
                          icon:Icon(Icons.location_on_outlined,color: AppColors.blue,size: size.height*.1,)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                         ClipOval(child: Image.asset(IconUrl.precise,
                             height:size.height*.2,
                         width: size.width*.27
                         ),),
                        ClipOval(child: Image.asset(IconUrl.approxImage,
                            height:size.height*.2,
                            width: size.width*.27
                        ),),
                      ],),
                     gap,
                      Column(
                        children: [
                          CustomButton(size: size,
                            name: 'While Using the app', text: '',),
                          gap,
                          CustomButton(size: size,
                            name: 'Only this time',),
                          gap,
                          CustomButton(size: size,
                            name: "Don't Allow",),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ),
          ),
          SizedBox(height: size.height*.1,),
        ],
      ),
    );
  }
}


*/
