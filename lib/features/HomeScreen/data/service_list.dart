
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woman_safety_ui/features/sos_screen/ui/screens/trusted_contact_screen.dart';
import '../../../app/utils/color/app_colors.dart';
import '../../number/emergency_number_screen.dart';

List<Map<String, dynamic>> serviceList = [
  {
    'icon': Icon(Icons.call,size: 30,color: AppColors.white,),
    'title': 'Argent Call',
    'onTap': (){
      Get.toNamed(EmergencyNumberScreen.name);
    },
  },
  {
    'icon': const Icon(Icons.add,size: 30,color: AppColors.white,),
    'title': 'Add Trusted Contact',
    'onTap': (){
      Get.toNamed(TrustedContactScreen.name);
    },
  },
  {
    'icon': Icon(Icons.call,size: 30,color: AppColors.white,),
    'title': 'Argent Call',
    'onTap': (){
      Get.toNamed(EmergencyNumberScreen.name);
    },
  },
  {
    'icon': const Icon(Icons.add,size: 30,color: AppColors.white,),
    'title': 'Add Trusted Contact',
    'onTap': (){
      Get.toNamed(TrustedContactScreen.name);
    },
  },
  {
    'icon': Icon(Icons.call,size: 30,color: AppColors.white,),
    'title': 'Argent Call',
    'onTap': (){
      Get.toNamed(EmergencyNumberScreen.name);
    },
  },
  {
    'icon': const Icon(Icons.add,size: 30,color: AppColors.white,),
    'title': 'Add Trusted Contact',
    'onTap': (){
      Get.toNamed(TrustedContactScreen.name);
    },
  },
];