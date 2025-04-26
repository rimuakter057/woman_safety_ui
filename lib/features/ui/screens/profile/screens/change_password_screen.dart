import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woman_safety_ui/features/ui/screens/profile/screens/profile_screen.dart';

import '../../../../../app/utils/sizes/size.dart';

import '../../../common/widget/custom_button.dart';
import '../../../common/widget/custom_text_form_field.dart';
import '../../auth/screens/widget/field_title_text.dart';
import '../widget/profile_widget.dart';


class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});
  static const String name = '/change-password';

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final changePassKey = GlobalKey<FormState>();

  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmedPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*      appBar: CustomImageAppBar(title: "change password", onTap: () {
        Get.back();
      },),*/
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04), // responsive padding
        
          child: Column(
            children: [
              ///show profile
              ProfileWidget( name: "Your Name", subtitle: "App Developer"),
            /// text form field
            _buildForm(context),
        
              SizedBox(height:AppSizes.height(context)* 0.1,),
        
              /// custom button
              CustomButton(text: "submit", onPressed: (){
                Get.snackbar('Success', 'save successfully');
                      Get.offAllNamed(ProfileScreen.name);
              }),
        
        
            ],
          ),
        ),
      ),
    );
  }

  Form _buildForm(BuildContext context) {
    return Form(
          key: changePassKey,
          autovalidateMode:AutovalidateMode.onUserInteraction,  // only show error after interaction
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldTitle(text: 'Password',),
              CustomTextFormField(
                keyboardType: TextInputType.emailAddress,
               controller: passController,
                hintText: "enter password",),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04), // responsive spacing
              FieldTitle(text: 'Confirmed Password',),
              CustomTextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: confirmedPassController,  hintText: "enter same password",),
            ],
          ),
        );
  }
}