import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/validator/regx_validator.dart';
import '../../main_nav_screen/main_nav_screen.dart';


class SignInController extends GetxController {
  final signInFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isObscure = true.obs;
  var isFormFieldValid = false.obs;

  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }

  // ✅ Proper email validation with required check
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    return RegexValidator.validateEmail(value);
  }

  // ✅ Proper password validation with required check
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return RegexValidator.validatePassword(value);
  }

  void submitSignIn() {
    if (signInFormKey.currentState!.validate()) {
      String email = emailController.text;
      String password = passwordController.text;


        print("Email: $email\n password: $password");


      Get.snackbar('Success', 'Logged in successfully!');

      Get.offAllNamed(MainNavScreen.name);
      clearForm();
    }
  }


  void clearForm() {
    emailController.clear();
    passwordController.clear();
  }


  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
