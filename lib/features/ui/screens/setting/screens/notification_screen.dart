import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*      appBar:CustomImageAppBar(
        title: "Alarm Time Set",
        onTap: () {
          Get.back();
        },),*/
      body: Center(child: Text("prayer list")),
    );
  }
}
