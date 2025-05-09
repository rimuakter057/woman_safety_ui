import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:woman_safety_ui/features/auth/screens/sign_in_screen.dart';
import '../../number/emergency_number_screen.dart';
import '../../setting/screens/privacy_policy_screen.dart';
import '../faq_screen.dart';


 _womanNewsDocs() async {
  final Uri url = Uri.parse('https://www.thedailystar.net/tags/women-safety');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

List<Map<String, dynamic>> drawerList = [
  {
    'icon': Icons.message,
    'title':"Anonymous Alert",
    'onTap': (){
      Get.toNamed(EmergencyNumberScreen.name);
    },
  },
  {
    'icon':  Icons.question_mark_outlined,
    'title':"FAQ",
    'onTap': (){
      Get.toNamed(FaqScreen.name);
    },
  },
  {
    'icon': Icons.logout,
    'title':"Logout",
    'onTap': (){
      Get.toNamed(SignInScreen.name);
    },
  },
  {
    'icon': Icons.safety_check,
    'title':"Safety News",
    'onTap': _womanNewsDocs,
  },
];




