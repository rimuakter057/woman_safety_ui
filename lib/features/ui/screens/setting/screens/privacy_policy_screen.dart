import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
/*      appBar:CustomImageAppBar(
        title: "Privacy Policy",
        onTap: () {
          Get.back();
        },),*/
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
              leading: Icon(Icons.circle, size: 10, color: Colors.green),
              title: Text(point,style: Theme.of(context).textTheme.titleSmall,),
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
            ),
          ),
        ],
      ),
    );
  }
}









