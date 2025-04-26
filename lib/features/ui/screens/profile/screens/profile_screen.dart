import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../app/utils/sizes/size.dart';
import '../../../common/Widget/custom_button.dart';
import '../../auth/screens/sign_in_screen.dart';
import '../../setting/screens/help_center_screen.dart';
import '../../setting/screens/privacy_policy_screen.dart';
import '../widget/profile_option.dart';
import '../widget/profile_widget.dart';
import 'change_password_screen.dart';
import 'edit_profile_screen.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static String name = "/profile-screen";
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: CustomImageAppBar(title: "Profile Screen", onTap: () {
          Get.back();
        },),*/
      body: SingleChildScrollView(
        child: Column(children: [
          ///show profile
          ProfileWidget( name: "Your Name", subtitle: "App Developer"),
           /// profile option
          _buildProfileOption(context)
        ],),
      )
    );
  }


  /// profile option
  Widget _buildProfileOption(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04), // responsive padding
      child: Column(
        children: [
          ProfileOptionWidget(
            icon: Icons.lock_outline,
            title: "Personal Information",
            onTap: () {
              // Navigate to password screen
            },
          ),
          ProfileOptionWidget(
            icon: Icons.lock_outline,
            title: "Edit Profile",
            onTap: () {
              Get.toNamed(EditProfileScreen.name);
    
            },
          ),
          ProfileOptionWidget(
            icon: Icons.lock_outline,
            title: "Change Password",
            onTap: () {
              Get.toNamed(ChangePasswordScreen.name);
    
            },
          ),
          ProfileOptionWidget(
            icon: Icons.lock_outline,
            title: "Help Center",
            onTap: () {
              Get.toNamed(HelpCenterScreen.name);
    
    
            },
          ),
          ProfileOptionWidget(
            icon: Icons.lock_outline,
            title: "Privacy Policy",
            onTap: () {
              Get.toNamed(PrivacyPolicyScreen.name);
    
    
            },
          ),
          SizedBox(height: AppSizes.width(context)*0.1,),
          CustomButton(text: "Logout", onPressed: (){
            Get.offAllNamed(SignInScreen.name);
          }),
        ],
      ),
    );
  }


}
