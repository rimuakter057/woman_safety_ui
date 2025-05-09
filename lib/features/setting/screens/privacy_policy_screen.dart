import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woman_safety_ui/app/utils/color/app_colors.dart';
import 'package:woman_safety_ui/features/common/widget/custom_icon.dart';

import '../../common/widget/custom_appbar.dart';
import '../data/privacy_text.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});
  static const String name = '/privacy-policy-screen';
  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: CustomAppBar(title: "privecy policy",leadingWidget: CustomIcon(),),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Icon(Icons.privacy_tip, size: 28, color: Colors.blue),
              SizedBox(width: 8),
              Text(
                "Privacy Policy",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 16),
          ...privacyPolicyPoints.map(
                (point) => ListTile(
              leading: Icon(Icons.circle, size: 10, color: AppColors.primaryColor),
              title: Text(point,style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.black),),
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
            ),
          ),
        ],
      ),
    );
  }
}









