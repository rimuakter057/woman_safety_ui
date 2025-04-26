import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woman_safety_ui/features/ui/screens/auth/screens/sign_in_screen.dart';
import 'package:woman_safety_ui/features/ui/screens/auth/screens/widget/divider_or.dart';
import 'package:woman_safety_ui/features/ui/screens/auth/screens/widget/field_title_text.dart';
import 'package:woman_safety_ui/features/ui/screens/auth/screens/widget/rich_text.dart';
import 'package:woman_safety_ui/features/ui/screens/auth/screens/widget/sign_in_up_head_container.dart';
import 'package:woman_safety_ui/features/ui/screens/auth/screens/widget/terms_condition.dart';

import '../../../../../app/utils/sizes/size.dart';
import '../../../common/Widget/custom_button.dart';
import '../../../common/widget/custom_text_form_field.dart';
import '../controllers/sign_in_controller.dart';
import '../controllers/signup_controller.dart';


class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  static const String name = '/sign-up ';

  final SignUpController controller = Get.find<SignUpController>();
  @override
  Widget build(BuildContext context) {
    Widget space=SizedBox(height: MediaQuery.of(context).size.width * 0.02,);
    return Scaffold(
      body: Column(
        children: [
          SignHeaderContainer(
            subtitle: "Sign up to continue",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(AppSizes.defaultPadding(context)), // responsive padding
                child: Column(
                  children: [
                    ///text form
                    _buildSignUpForm(context,space),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.06),
                 /// terms and condition
                    CheckBoxRow(),
                    space,
                    ///sign Up button
                    CustomButton(text: 'Sign Up',
                      onPressed: () {
                        controller.submitSignUp();

                                  },),
                    space,
                    DividerOr(),
                    space,
                    ///Google button
                    CustomButton(text: 'Continue with Google',
                      onPressed: () {
                        controller.submitSignUp();
                        print("sign up google");
                      },),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                    ///sign in section
                    RichTextWidget(
                      normalText: 'Already have an account?',
                      actionText: '  Sign In',
                      onTap: () {
                        Get.toNamed(SignInScreen.name);
                    },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
///sign up form
  Form _buildSignUpForm(BuildContext context,Widget space) {

                 return Form(
                    key: controller.signUpFormKey,
                    autovalidateMode:AutovalidateMode.onUserInteraction,  // only show error after interaction
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FieldTitle(text: 'Name',),
                        CustomTextFormField(controller: controller.nameController,
                          hintText: 'Enter your name',
                        validator: controller.validateName,
                        ),
                        space,
                        FieldTitle(text: 'Email',),
                       CustomTextFormField(
                         controller: controller.emailController,
                           hintText: 'email334@gmail.com',
                         keyboardType: TextInputType.emailAddress,
                         validator: controller.validateEmail,
                         onChanged: (value) {
                           controller.isFormFieldValid.value = true;  // enable validation for user interaction
                         },
                       ),
                        space,
                       FieldTitle(text: 'Password',),
                        CustomTextFormField(controller: controller.passwordController,
                          hintText: 'Strong Password',
                          validator: controller.validatePassword,
                        ),
                        space,
                        FieldTitle(text: 'Confirmed Password',),
                        CustomTextFormField(controller:controller.confirmedPassController,
                          hintText: 'Confirmed Password',
                          validator: controller.validateConfirmPassword,
                        ),


                      ],
                    ),
                  );
  }
}



