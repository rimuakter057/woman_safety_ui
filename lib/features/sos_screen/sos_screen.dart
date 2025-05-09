import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:woman_safety_ui/app/utils/color/app_colors.dart';
import 'package:woman_safety_ui/app/utils/sizes/size.dart';
import 'package:woman_safety_ui/features/sos_screen/widget/custom_small_button.dart';
import 'package:woman_safety_ui/features/sos_screen/widget/custom_sos_button.dart';
import '../common/widget/custom_appbar.dart';
import '../common/widget/custom_icon.dart';
import 'data/models/trustedNumberModel.dart';


class SosScreen extends StatefulWidget {
  const SosScreen({super.key});
  static const String name = '/sos-screen';

  @override
  State<SosScreen> createState() => _SosScreenState();
}

class _SosScreenState extends State<SosScreen> {
  List<TrustedContactModel> trustedContacts = [];

  @override
  void initState() {
    super.initState();
    loadTrustedContacts();
  }

  Future<void> loadTrustedContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList('trusted_contacts') ?? [];
    trustedContacts = data
        .map((item) =>
        TrustedContactModel.fromJson(jsonDecode(item)))
        .toList();
    setState(() {});
  }


  Future<void> sendSOSCall() async {
    const emergencyNumber = "999";
    final Uri callUri = Uri.parse("tel:$emergencyNumber");
    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    }
  }

  Future<void> sendFakeCalls() async {
    for (var contact in trustedContacts) {
      final Uri callUri = Uri.parse("tel:${contact.number}");
      if (await canLaunchUrl(callUri)) {
        await launchUrl(callUri);
      }
    }
  }

  Future<void> sendFakeMessages() async {
    for (var contact in trustedContacts) {
      final Uri smsUri = Uri.parse("sms:${contact.number}?body=I need help urgently!");
      if (await canLaunchUrl(smsUri)) {
        await launchUrl(smsUri);
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(title: "sos screen",
      leadingWidget: CustomIcon( ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(width * 0.05), // Responsive Padding
          child: Column(
            children: [
              SizedBox(height: height * 0.03),
              Center(
                child: Text(
                  "EMERGENCY HELP",
                  style: TextStyle(
                    fontSize: width * 0.08, // Responsive Font Size
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: height * 0.05),

              // Card with SOS Button
              Expanded(
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(AppSizes.defaultPadding(context)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(),
                        CustomSOSButton(
                          buttonSize: width * 0.4, // Size passed to SOS Button
                          onPressed: () {
                            sendSOSCall();
                          },
                        ),
                        SizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomSmallButton(
                              label: "Fake Call",
                              width: width * 0.35,
                              onPressed: () {
                                sendFakeCalls();
                              },
                            ),
                            CustomSmallButton(
                              label: "Fake Sms",
                              width: width * 0.35,
                              onPressed: () {
                                sendFakeMessages();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
