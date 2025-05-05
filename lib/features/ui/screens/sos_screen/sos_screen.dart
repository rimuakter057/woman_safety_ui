import 'package:flutter/material.dart';
import 'package:woman_safety_ui/app/utils/color/app_colors.dart';
import 'package:woman_safety_ui/app/utils/sizes/size.dart';
import 'package:woman_safety_ui/features/ui/common/widget/custom_appbar.dart';
import 'package:woman_safety_ui/features/ui/common/widget/custom_icon.dart';
import 'package:woman_safety_ui/features/ui/screens/sos_screen/widget/custom_small_button.dart';
import 'package:woman_safety_ui/features/ui/screens/sos_screen/widget/custom_sos_button.dart';


class SosScreen extends StatelessWidget {
  const SosScreen({super.key});
  static const String name = '/sos-screen';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(title: "sos screen",
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
                            // SOS action
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
                                // Fake call action
                              },
                            ),
                            CustomSmallButton(
                              label: "Location",
                              width: width * 0.35,
                              onPressed: () {
                                // Location action
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
