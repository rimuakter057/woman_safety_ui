import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woman_safety_ui/core/utils/toast_message.dart';
import '../../../../../app/utils/sizes/size.dart';
import '../../auth/screens/sign_in_screen.dart';
import '../../chatting/screens/AllChatList/user_list/user_list_screen.dart';
import '../../common/widget/custom_appbar.dart';
import '../../common/widget/custom_button.dart';
import '../../common/widget/custom_icon.dart';
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
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Profile Screen",
          leadingWidget: CustomIcon(),
        ),
      body: SingleChildScrollView(
        child: Column(children: [
          ///show profile
          const ProfileWidget( name: "Your Name", subtitle: "App Developer"),
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
            auth.signOut().then((value){
              Get.offAllNamed(SignInScreen.name);
            }).onError((error, stackTrace){
              Utils().toastMessage(error.toString());
            });
          }),
        ],
      ),
    );
  }


}
