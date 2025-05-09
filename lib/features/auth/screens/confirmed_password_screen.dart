import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woman_safety_ui/features/auth/screens/sign_in_screen.dart';

import '../../common/widget/custom_button.dart';
import '../../profile/widget/profile_widget.dart';
import '../controllers/confirmed_pass_controller.dart';

class ConfirmedPasswordScreen extends StatelessWidget {
  ConfirmedPasswordScreen({super.key});
  static const String name = '/confirmed-password';

  final ConfirmedPassController controller = Get.find<ConfirmedPassController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 40,),
              const ProfileWidget(),
              SizedBox(height: 40,),
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => TextFormField(
                      controller: controller.passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                        errorText: controller.passwordError.value.isEmpty
                            ? null
                            : controller.passwordError.value,
                      ),
                      onChanged: (_) {
                        controller.validatePasswordField();
                        controller.liveConfirmCheck();
                      },
                    )),
                    const SizedBox(height: 16),
                    Obx(() => TextFormField(
                      controller: controller.confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        border: OutlineInputBorder(),
                        errorText: controller.confirmPasswordError.value.isEmpty
                            ? null
                            : controller.confirmPasswordError.value,
                      ),
                      onTap: () => controller.validateConfirmField(),
                      onChanged: (_) => controller.validateConfirmField(),
                    )),
                  ],
                ),
              ),
        
              const SizedBox(height: 24),
        
                  CustomButton(text: "submit", onPressed: (){
                    controller.handleSubmit();
                    Get.offAllNamed(SignInScreen.name);
                  })
        
        
            ],
          ),
        ),
      ),
    );
  }
}
