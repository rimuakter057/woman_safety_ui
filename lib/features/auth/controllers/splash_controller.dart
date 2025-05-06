
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:woman_safety_ui/features/auth/screens/sign_in_screen.dart';
import 'package:woman_safety_ui/features/main_nav_screen/main_nav_screen.dart';

class SplashServices{
   void isSignIn()async{
     FirebaseAuth auth=FirebaseAuth.instance;
     final user=auth.currentUser;
     if(user!=null){
       await  Future .delayed(Duration(seconds: 3));
       Get.toNamed(MainNavScreen.name);
     }else{
       await  Future .delayed(Duration(seconds: 3));
       Get.toNamed(SignInScreen.name);
     }
   }
}