

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:woman_safety_ui/features/auth/screens/confirmed_password_screen.dart';
import 'package:woman_safety_ui/features/auth/screens/widget/rich_text.dart';

import '../../../../../app/utils/color/app_colors.dart';
import '../../../../../app/utils/sizes/size.dart';
import '../../common/widget/custom_button.dart';
import '../../profile/widget/profile_widget.dart';



class OtpSendScreen extends StatefulWidget {
  const OtpSendScreen({super.key});
  static const String name = '/otp-send-screen';

  @override
  State<OtpSendScreen> createState() => _OtpSendScreenState();
}

class _OtpSendScreenState extends State<OtpSendScreen> {
  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            SizedBox(height: 40,),
            const ProfileWidget( ),
            SizedBox(height: 40,),
           Column(
             children: [
               Text("OTP Verification code",style: Theme.of(context).textTheme.bodyLarge,),
               Text("OTP Verification code",style:Theme.of(context).textTheme.titleSmall,),
               PinCodeTextField(
                 controller: _otpController,
                 keyboardType: TextInputType.number,
                 length: 4,
                 pinTheme:PinTheme(

                   errorBorderColor: AppColors.black,
                   inactiveColor: AppColors.primaryColor,
                   activeColor: AppColors.purple,
                   shape: PinCodeFieldShape.box,
                   borderRadius: BorderRadius.circular(AppSizes.width(context)*0.012),
                 ),
                 backgroundColor: Colors.transparent,
                 appContext: context,
               ),
               RichTextWidget(
                 normalText: 'Don\'t receive the code? ',
                 actionText: 'Resend',
                 onTap: () {
                   // Sign in route or action
                   debugPrint('Navigating resend...');
                   // Get.toNamed('/sign-in'); // if you're using GetX
                 },
               ),
               SizedBox(height: 40,),
               SizedBox(
                 height: MediaQuery.of(context).size.width * 0.12, // responsive button height
                 child: CustomButton(text: 'Continue', onPressed: () {
                   Get.toNamed(ConfirmedPasswordScreen.name);
                 },),
               ),
             ],
           )
          ],),
        ),
      ),
    );
  }
}
