import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/utils/color/app_colors.dart';
import '../../../../../app/utils/sizes/size.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 /* bool _navigated = false;
  @override
  void initState() {
    super.initState();
    nextScreen();
  }

  Future<void> nextScreen() async {
    await Future.delayed(const Duration(seconds: 1));
    if (!_navigated) {
      _navigated = true;
      Get.offNamed(SignInScreen.name);
    }// Navigate to sign-in after splash
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.all(AppSizes.defaultPadding(context)),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              Text(
                "logo",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
