import 'package:flutter/material.dart';
import 'package:woman_safety_ui/features/auth/controllers/splash_controller.dart';


import '../../../../../app/utils/color/app_colors.dart';
import '../../../../../app/utils/sizes/size.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isSignIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.all(AppSizes.defaultPadding(context)),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              const Text("Your safety, our priority",style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),),
            Image.asset("assets/images/logo/logo.png",height: 200,width: 200,
            fit: BoxFit.fill,
            ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
