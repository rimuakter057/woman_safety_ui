import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woman_safety_ui/core/utils/toast_message.dart';
import 'package:woman_safety_ui/features/auth/screens/sign_in_screen.dart';
import 'package:woman_safety_ui/features/auth/screens/widget/divider_or.dart';
import 'package:woman_safety_ui/features/auth/screens/widget/field_title_text.dart';
import 'package:woman_safety_ui/features/auth/screens/widget/rich_text.dart';
import 'package:woman_safety_ui/features/auth/screens/widget/sign_in_up_head_container.dart';
import 'package:woman_safety_ui/features/auth/screens/widget/terms_condition.dart';
import '../../../app/utils/sizes/size.dart';
import '../../../core/validator/regx_validator.dart';
import '../../common/widget/custom_button.dart';
import '../../common/widget/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String name = '/sign-up ';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  final signUpFormKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmedPassController = TextEditingController();

  ///on tap sign up
  void onTapSignUp () {


  }
  @override
  Widget build(BuildContext context) {
    Widget space = SizedBox(
      height: MediaQuery.of(context).size.width * 0.02,
    );
    return Scaffold(
      body: Column(
        children: [
          const SignHeaderContainer(
            subtitle: "Sign up to continue",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(
                    AppSizes.defaultPadding(context)), // responsive padding
                child: Column(
                  children: [
                    ///text form
                    _buildSignUpForm(context, space),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.06),

                    /// terms and condition
                    const CheckBoxRow(),
                    space,

                    ///sign Up button
                    CustomButton(
                      text: 'Sign Up',
                      onPressed: () {
                    if (signUpFormKey.currentState!.validate()) {
                      _auth.createUserWithEmailAndPassword(
                          email: emailController.text.toString(),
                          password: passwordController.text.toString()).then((value){
                        Get.snackbar('Success', 'Registration successfully!');
                        Get.offAllNamed(SignInScreen.name);
                      }).onError((error, stackTrace){
                        Utils().toastMessage(error.toString());
                      });

                    }
                    }
                    ),
                    space,
                    const DividerOr(),
                    space,

                    ///Google button
                    CustomButton(
                      text: 'Continue with Google',
                      onPressed: () {
                        print("sign up google");
                      },
                    ),
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
  Form _buildSignUpForm(BuildContext context, Widget space) {
    return Form(
      key: signUpFormKey,
      autovalidateMode: AutovalidateMode
          .onUserInteraction, // only show error after interaction
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FieldTitle(
            text: 'Name',
          ),
          CustomTextFormField(
            controller: nameController,
            hintText: 'Enter your name',
            validator: (String? value){
              if (value == null || value.isEmpty) {
                return 'Name is required';
              }
              return null;
            },
          ),
          space,
          const FieldTitle(
            text: 'Email',
          ),
          CustomTextFormField(
            controller: emailController,
            hintText: 'email334@gmail.com',
            keyboardType: TextInputType.emailAddress,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              }
              return RegexValidator.validateEmail(value);
            },
          ),
          space,
          const FieldTitle(
            text: 'Password',
          ),
          CustomTextFormField(
            controller: passwordController,
            hintText: 'Strong Password',
            validator: (String? value) {
              if (value == null || value.isEmpty || value.length < 6) {
                return 'password is required';
              }
              return null;
            },
          ),
          space,
          const FieldTitle(
            text: 'Confirmed Password',
          ),
          CustomTextFormField(
            controller: confirmedPassController,
            hintText: 'Confirmed Password',
            validator: (String? value) {
              if (value == null || value.isEmpty || value.length < 6) {
                return 'password is required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }


  void clearForm() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmedPassController.clear();
  }
}
