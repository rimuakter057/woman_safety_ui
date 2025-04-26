import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widget/custom_button.dart';
import '../controllers/confirmed_pass_controller.dart';

class ConfirmedPasswordScreen extends StatelessWidget {
  ConfirmedPasswordScreen({super.key});
  static const String name = '/confirmed-password';

  final ConfirmedPassController controller = Get.find<ConfirmedPassController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                })


          ],
        ),
      ),
    );
  }
}
