

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:woman_safety_ui/app/utils/color/app_colors.dart';
import 'package:woman_safety_ui/features/common/widget/custom_appbar.dart';
import 'package:woman_safety_ui/features/common/widget/custom_divider.dart';
import 'data/models/emergency_number_model.dart';

class EmergencyNumberScreen extends StatefulWidget {
  const EmergencyNumberScreen({super.key});
  static const String name = '/emergency-number-screen';

  @override
  State<EmergencyNumberScreen> createState() => _EmergencyNumberScreenState();
}

class _EmergencyNumberScreenState extends State<EmergencyNumberScreen> {
  final List <EmergencyContactModel> contactList = [];


///get data from json
  Future <void> getContactList()async{
    final String responseData= await rootBundle.loadString("assets/number/emergency_number_list.Json");
    final decodeData = json.decode(responseData);
    contactList.addAll((decodeData as List).map((e) => EmergencyContactModel.fromJson(e)).toList());
setState(() {

});
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContactList();
  }

  ///call function
  Future<void>_callNumber(String number)async{
    final Uri phoneUri=Uri(scheme: 'tel',path: number);
    if(await launchUrl(phoneUri)){
      await launchUrl(phoneUri);
    }else{
      throw 'Could not launch $number';
    }
  }
///sms function
  Future<void>_smsNumber(String number)async{
    final Uri smsUri=Uri(scheme: 'sms',path: number);
    if(await launchUrl(smsUri)){
      await launchUrl(smsUri);
    }else{
      throw 'Could not launch $number';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title:"Emergency Number",
      leadingWidget: IconButton(onPressed: (){
      Get.back();
      }, icon: const Icon(Icons.arrow_back,color: AppColors.white,),),
      ),
      body: ListView.builder(
          itemCount: contactList.length,
          itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              ListTile(
                title: Text(contactList[index].name,style: const TextStyle(  fontSize: 18,fontWeight: FontWeight.normal),),
                subtitle: Text(contactList[index].number,style: const TextStyle(  fontSize: 18,fontWeight: FontWeight.bold),),
                trailing: Wrap(
                  children: [
                    IconButton(onPressed: (){
                      _callNumber(contactList[index].number);
                    }, icon: const Icon(Icons.call)),
                    IconButton(onPressed: (){
                      _smsNumber(contactList[index].number);
                    }, icon: const Icon(Icons.message)),
                  ],
                ),
              ),
              const CustomDivider(),
            ],
          ),
        );
      }),
    );
  }
}
