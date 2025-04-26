import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/help_text.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});
  static const String name = '/help-center-screen';
  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*      appBar:CustomImageAppBar(
        title: "Help Center",
        onTap: () {
          Get.back();
        },),*/
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Icon(Icons.help_outline, size: 28, color: Colors.blue),
              SizedBox(width: 8),
              Text(
                "Help Center",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 16),

          ...helpCenterData.entries.map((section) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                section.key,
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              ...section.value.map(
                    (point) => ListTile(
                  leading: Icon(Icons.circle, size: 10, color: Colors.deepPurple),
                  title:Text(point,style: Theme.of(context).textTheme.titleSmall,),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  dense: true,
                ),
              ),
              SizedBox(height: 12),
            ],
          )),
        ],
      ),
    );
  }
}





