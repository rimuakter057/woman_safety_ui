


import 'package:get/get.dart';

import '../features/auth/controllers/confirmed_pass_controller.dart';
import '../features/auth/controllers/sign_in_controller.dart';
import '../features/auth/controllers/signup_controller.dart';
import '../features/profile/controllers/edit_profile_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => ConfirmedPassController());
    Get.lazyPut(() => EditProfileController());
  }
}