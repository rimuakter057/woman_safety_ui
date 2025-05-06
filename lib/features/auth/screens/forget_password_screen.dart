import 'package:flutter/material.dart';
import 'package:woman_safety_ui/features/auth/screens/widget/field_title_text.dart';
import '../../common/widget/custom_button.dart';



class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});
  static const String name = '/forget-password-screen';

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
      //  CustomImageAppBar(),
        SizedBox(height: 40,),
        FieldTitle(text: 'Email',),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'email334@gmail.com',
          ),
          keyboardType: TextInputType.emailAddress,

        ),
        SizedBox(height: 40,),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.12, // responsive button height
          child: CustomButton(text: 'Sign In', onPressed: () {
            print("sign in");
          },),
        ),
      ],),
    );
  }
}
