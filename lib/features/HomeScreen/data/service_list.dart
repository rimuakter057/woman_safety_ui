
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:woman_safety_ui/features/map/ui/screens/google_map_home_screen.dart';
import 'package:woman_safety_ui/features/sos_screen/ui/screens/trusted_contact_screen.dart';
import '../../../app/utils/color/app_colors.dart';
import '../../auth/screens/sign_in_screen.dart';
import '../../number/emergency_number_screen.dart';
import '../faq_screen.dart';
_womanNewsDocs() async {
  final Uri url = Uri.parse('https://www.thedailystar.net/tags/women-safety');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
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
    'icon': Icon(Icons.location_on,size: 30,color: AppColors.white,),
    'title':"Shear Location",
    'onTap': (){
      Get.toNamed(GoogleMapHomeScreen.name);
    },
  },
  {
    'icon': Icon(Icons.question_mark_outlined,size: 30,color: AppColors.white,),
    'title':"FAQ",
    'onTap': (){
      Get.toNamed(FaqScreen.name);
    },
  },

  {
    'icon': Icon(Icons.safety_check,size: 30,color: AppColors.white,),
    'title':"Safety News",
    'onTap': _womanNewsDocs,
  },
];