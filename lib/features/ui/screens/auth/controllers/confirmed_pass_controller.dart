import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmedPassController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var passwordError = ''.obs;
  var confirmPasswordError = ''.obs;
  var confirmFieldTouched = false.obs;

  void validatePasswordField() {
    if (passwordController.text.isEmpty) {
      passwordError.value = "Password can't be empty";
    } else {
      passwordError.value = "";
    }
  }

  void validateConfirmField() {
    confirmFieldTouched.value = true;

    if (confirmPasswordController.text != passwordController.text) {
      confirmPasswordError.value = "Passwords do not match";
    } else {
      confirmPasswordError.value = "";
    }
  }

  void liveConfirmCheck() {
    if (confirmFieldTouched.value) {
      if (confirmPasswordController.text != passwordController.text) {
        confirmPasswordError.value = "Passwords do not match";
      } else {
        confirmPasswordError.value = "";
      }
    }
  }

  void handleSubmit() {
    validatePasswordField();
    validateConfirmField();

    if (passwordError.value.isEmpty && confirmPasswordError.value.isEmpty) {
      Get.snackbar("Success", "Passwords matched and valid!",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
