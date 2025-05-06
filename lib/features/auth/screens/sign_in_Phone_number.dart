import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woman_safety_ui/core/utils/toast_message.dart';
import 'package:woman_safety_ui/features/auth/screens/sign_up_screen.dart';
import 'package:woman_safety_ui/features/auth/screens/widget/field_title_text.dart';
import 'package:woman_safety_ui/features/auth/screens/widget/rich_text.dart';
import 'package:woman_safety_ui/features/auth/screens/widget/sign_in_up_head_container.dart';
import 'package:woman_safety_ui/features/auth/screens/widget/terms_condition.dart';
import '../../../../../app/utils/color/app_colors.dart';
import '../../../../../app/utils/sizes/size.dart';
import '../../../../../app/utils/text/text_style.dart';

import '../../../core/validator/regx_validator.dart';
import '../../common/widget/custom_button.dart';
import '../../common/widget/custom_text_form_field.dart';
import '../../main_nav_screen/main_nav_screen.dart';

import 'forget_password_screen.dart';

class SignInPhoneScreen extends StatefulWidget {
  const SignInPhoneScreen({super.key});
  static const String name = '/sign-in-phone ';

  @override
  State<SignInPhoneScreen> createState() => _SignInPhoneScreenState();
}

class _SignInPhoneScreenState extends State<SignInPhoneScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  void onTapSignIn() async {}
  final TextEditingController numberController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SignHeaderContainer(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(
                    AppSizes.defaultPadding(context)), // responsive padding
                child: Column(
                  children: [
                    ///phone number
                    _buildTextForm(context),

                    ///forget password
                    Row(
                      children: [
                        const SizedBox(),
                        const Spacer(),

                        ///forget password button
                        TextButton(
                          onPressed: () {
                            Get.toNamed(ForgetPasswordScreen.name);
                          },
                          child: Text("forget number",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: AppColors.primaryColor)),
                        ),
                      ],
                    ),

                    ///remember me
                    const CheckBoxRow(
                      text: "Remember me",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.08,
                    ),

                    ///sign in button
                    CustomButton(
                        text: 'Sign In',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            _auth
                                .verifyPhoneNumber(
                                    phoneNumber: numberController.text,
                                    verificationCompleted: (_) {},
                                verificationFailed: (e) {
                                      Utils().toastMessage(e.toString());
                                },
                                codeSent: (String verificationId, int? forceResendingToken) {

                                },
                                codeAutoRetrievalTimeout: (e) {
                                  Utils().toastMessage(e.toString());
                                })
                                .then((value) {
                              Get.snackbar('Success', 'sign in successfully!');
                              Get.offAllNamed(MainNavScreen.name);
                            }).onError((error, stackTrace) {
                              Utils().toastMessage(error.toString());
                            });
                          }
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),

                    ///switch to sign up
                    RichTextWidget(
                      normalText: 'Don\'t have an account?',
                      actionText: '  Registration',
                      onTap: () {
                        Get.offAllNamed(SignUpScreen.name);
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

  ///email and password field
  Form _buildTextForm(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode
          .onUserInteraction, // only show error after interaction
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.width *
                  0.04), // responsive spacing
          const FieldTitle(
            text: 'phone number',
          ),
          TextFormField(
            style: AppTextStyles.inputTextStyle(context),
            controller: numberController,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'phone number',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty || value.length < 11) {
                return 'number is required';
              }
              return null;
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    numberController.dispose();
    super.dispose();
  }
}
