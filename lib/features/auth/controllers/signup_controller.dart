/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/validator/regx_validator.dart';

class SignUpController extends GetxController {
  final signUpFormKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmedPassController= TextEditingController();


  var isFormFieldValid = false.obs;  // Add this reactive variable


  String? validateEmail(String? value) => RegexValidator.validateEmail(value);
  String? validatePassword(String? value) => RegexValidator.validatePassword(value);

  void submitSignUp() {
    if (signUpFormKey.currentState!.validate()) {
      String name = nameController.text;
      String email = emailController.text.trim();
      String password = passwordController.text;
      String confirmedPassword = confirmedPassController.text;
      if(password!=confirmedPassword){
        Get.snackbar('Error', 'Password does not match');
      }

      Get.snackbar('Success', 'Registration  success');
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmedPassController.dispose();
    super.onClose();
  }
}
*/




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/validator/regx_validator.dart';
import '../screens/sign_in_screen.dart';

class SignUpController extends GetxController {
  final signUpFormKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmedPassController = TextEditingController();

  var isFormFieldValid = false.obs;

  // Validators
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    return RegexValidator.validateEmail(value); // যদি regex match না করে তাহলে এখানেই message return করবে
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return RegexValidator.validatePassword(value); // যদি regex match না করে তাহলে এখানেই message return করবে
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }



  void updateFormValidity() {
    isFormFieldValid.value = signUpFormKey.currentState?.validate() ?? false;
  }

  // Submit SignUp
  void submitSignUp() {
    if (signUpFormKey.currentState!.validate()) {
          String password = passwordController.text;
      String confirmedPassword = confirmedPassController.text;

      if (password != confirmedPassword) {
        Get.snackbar('Error', 'Password does not match');

      } else {
             Get.snackbar('Success', 'Registration successful');
             clearForm();
        Get.offAllNamed(SignInScreen.name);
      }
    }
  }

  void clearForm() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmedPassController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmedPassController.dispose();
    super.onClose();
  }
}
