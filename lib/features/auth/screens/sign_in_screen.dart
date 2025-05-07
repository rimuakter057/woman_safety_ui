import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woman_safety_ui/core/utils/toast_message.dart';
import 'package:woman_safety_ui/features/auth/screens/sign_in_Phone_number.dart';
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

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String name = '/sign-in ';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  FirebaseAuth _auth=FirebaseAuth.instance;

  void  onTapSignIn()async{




  }
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                    ///email and password field
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
                          child: Text("forget password",
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
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          _auth.signInWithEmailAndPassword(email: emailController.text.toString(),
                              password: passwordController.text.toString()).then((value){
                      String uid=value.user!.uid;
                      DatabaseReference ref=FirebaseDatabase.instance.ref("users/$uid");
                        ref.once().then((DatabaseEvent event){
                        if(event.snapshot.exists){
                          String name=event.snapshot.child('name').value.toString();
                          String email=event.snapshot.child('email').value.toString();

                          print('User Name: $name');
                          print('User Email: $email');
                          Get.snackbar('Success', 'Sign in successful!');
                          Get.offAllNamed(MainNavScreen.name);
                        }
                        }).catchError((e){
                          Utils().toastMessage(e.toString());
                        }).onError((error, stackTrace){
                          Utils().toastMessage(error.toString());
                        });

                          }).onError((error, stackTrace){
                            Utils().toastMessage(error.toString());
                          });

                        }
                      }
                    ),
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
                    ///sign in button
                    CustomButton(
                        text: 'Sign In Phone Number',
                        onPressed: (){

                          Get.toNamed(SignInPhoneScreen.name);
                        }
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
          SizedBox(
              height: MediaQuery.of(context).size.width *
                  0.04), // responsive spacing
          const FieldTitle(
            text: 'Password',
          ),
          TextFormField(
            style: AppTextStyles.inputTextStyle(context),
            controller: passwordController,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility,
                    size: MediaQuery.of(context).size.width *
                        0.06, // responsive icon size
                  ),
                  onPressed: () {
                    print("toggle text");
                  }),
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty || value.length < 6) {
                return 'password is required';
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
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

 }
