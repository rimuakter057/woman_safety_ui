import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:woman_safety_ui/app/controller/call_controller.dart';
import 'package:woman_safety_ui/app/utils/color.dart';
import 'package:woman_safety_ui/app/utils/text_style.dart';
import 'package:get/get.dart';
import 'Widget/call_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
     final getData = Get.put(CallController());
    return Scaffold(
        backgroundColor: AppColors.blackColor,
        floatingActionButton: Container(
          height: size.height*.06,
          width: size.width*.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
            color: Colors.blue,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.question_answer,color: AppColors.whiteColor,),
                Spacer(),
                Text("প্রশ্ন করুন?",style: MyTextStyle.commonTextStyle,),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: AppColors.blueColor,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back,color: AppColors.whiteColor,),
          ),
          centerTitle: true,
          title: Text(
            "আমাদের সেবা সমূহ",
            style: MyTextStyle.buttonTextStyle,
          ),
        ),
        body: Column(
          children: [
            Container(
              height: size.height * .2,
              width: size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/slide/slide_three.jpg",
                      ),
                      fit: BoxFit.cover)),
            ),
            Row(
              children: [
                Container(
                  height: size.height * .035,
                  width: size.width * .15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.whiteColor),
                  child: Center(
                      child: Text(
                    "মনে রাখবেন",
                    style: MyTextStyle.buttonTextStyle.copyWith(
                        fontSize: size.height * .013,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blueColor),
                  )),
                ),
                Expanded(
                  child: SizedBox(
                    height: size.height * .03,
                    child: Marquee(
                      text: 'নারী বলে অসম্মান করো না| নারীদের সুরক্ষা নিশ্চিত করা আমাদের সবার দায়িত্ব',style: MyTextStyle.buttonTextStyle.copyWith(fontSize: size.height*.03),
                      scrollAxis:Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height*.02,),
            Text("কল দিয়ে যোগাযোগ করুন",style: MyTextStyle.buttonTextStyle,),
            SizedBox(height: size.height*.015,),
            Expanded(
              child: SizedBox(
                child: GridView.builder(shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: getData.callServiceList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                    itemBuilder:(context,index){
                  return Column(children: [
                    Container(
                      height : size.height*.1,
                      width: size.width*.18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.whiteColor,
                      ),
                      child: Center(child: Icon(getData.callServiceList[index].icon,color: AppColors.blueColor,size:size.height*.08,)),
                    ),
                    SizedBox(height: size.height*.01,),
                    Text(getData.callServiceList[index].serviceName,style: MyTextStyle.commonTextStyle,),
                  ],);
                    }),
              ),
            )
          ],
        ));
  }
}


