
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:woman_safety_ui/app/model/call_services_model.dart';

class CallController extends GetxController {
  RxList <CallServicesModel> callServiceList = [
    CallServicesModel(icon: Icons.safety_check,
        serviceName: "স্বেচ্ছাসেবক"),
    CallServicesModel(icon: Icons.leaderboard_outlined,
        serviceName: "প্রফেসর"),
    CallServicesModel(icon: Icons.save,
        serviceName: "ক্যাপ্টেন"),
    CallServicesModel(icon: Icons.policy,
        serviceName: "পুলিশ"),
    CallServicesModel(icon: Icons.safety_check,
        serviceName: "সহপাঠী"),
  ].obs;
}