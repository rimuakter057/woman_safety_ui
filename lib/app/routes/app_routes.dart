import 'package:flutter/material.dart';
import 'package:woman_safety_ui/features/chatting/screens/AllChatList/MessagePageDetails/message_details.dart';
import 'package:woman_safety_ui/features/chatting/screens/AllChatList/user_list/user_list_screen.dart';
import 'package:woman_safety_ui/features/chatting/screens/HomePage/home_page.dart';
import 'package:woman_safety_ui/features/sos_screen/ui/screens/trusted_contact_screen.dart';

import '../../features/HomeScreen/home_screen.dart';
import '../../features/auth/screens/confirmed_password_screen.dart';
import '../../features/auth/screens/forget_password_screen.dart';
import '../../features/auth/screens/otp_send_screen.dart';
import '../../features/auth/screens/otp_verify_screen.dart';
import '../../features/auth/screens/password_change_screen.dart';
import '../../features/auth/screens/sign_in_Phone_number.dart';
import '../../features/auth/screens/sign_in_screen.dart';
import '../../features/auth/screens/sign_up_screen.dart';
import '../../features/auth/screens/splash_screen.dart';
import '../../features/main_nav_screen/main_nav_screen.dart';

import '../../features/number/emergency_number_screen.dart';
import '../../features/profile/screens/change_password_screen.dart';
import '../../features/profile/screens/edit_profile_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/setting/screens/help_center_screen.dart';
import '../../features/setting/screens/privacy_policy_screen.dart';
import '../../features/sos_screen/sos_screen.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    debugPrint("Route requested: ${settings.name}");

    late Widget route;

    if (settings.name == MainNavScreen.name) {
      route = const MainNavScreen();
    }
     else if (settings.name == SplashScreen.name) {
      route = const SplashScreen();
    }
    else if (settings.name == HomeScreen.name) {
      route =  HomeScreen();
    }
    else if (settings.name == SignInScreen.name) {
      route =  SignInScreen();
    }  else if (settings.name == SignInPhoneScreen.name) {
      route = SignInPhoneScreen();
    }
    else if (settings.name == SosScreen.name) {
      route =  SosScreen();
    }
    else if (settings.name == SignUpScreen.name) {
      route =  SignUpScreen();
    }
    else if (settings.name == ConfirmedPasswordScreen.name) {
      route =  ConfirmedPasswordScreen();
    }
    else if (settings.name == ForgetPasswordScreen.name) {
      route = const ForgetPasswordScreen();
    }
    else if (settings.name == PasswordChangeScreen.name) {
      route = const PasswordChangeScreen();
    }
    else if (settings.name == OtpVerifyScreen.name) {
      route = const OtpVerifyScreen();
    }
    else if (settings.name == ChangePasswordScreen.name) {
      route =  ChangePasswordScreen();
    }
    else if (settings.name == PrivacyPolicyScreen.name) {
      route = const PrivacyPolicyScreen();
    }
    else if (settings.name == EditProfileScreen.name) {
      route = const EditProfileScreen();
    }
    else if (settings.name == HelpCenterScreen.name) {
      route = const HelpCenterScreen();
    }
    else if (settings.name == OtpSendScreen.name) {
      route = const OtpSendScreen();
    }
    else if (settings.name == ProfileScreen.name) {
      route = const ProfileScreen();
    } else if (settings.name == HomePage.name) {
      route = const HomePage();
    } else if (settings.name == UserListScreen.name) {
      route = const UserListScreen();
    }
    else if (settings.name == MessageDetails.name) {
      final arguments = settings.arguments as Map<String, dynamic>;
      route =  MessageDetails(
          receiverId: arguments['receiverId'],
          receiverName: arguments['receiverName']);
    }
    else if (settings.name == EmergencyNumberScreen.name) {
      route = const EmergencyNumberScreen();
    }  else if (settings.name == TrustedContactScreen.name) {
      route = const TrustedContactScreen();
    }


/*    else if (settings.name == PrayerListScreen.name) {
      route = const PrayerListScreen();
    }
    else if (settings.name == HomeScreen.name) {
      route = const HomeScreen();
    } else if (settings.name == AlarmTimeSetScreen.name) {
      route = const AlarmTimeSetScreen();
    }
    else if (settings.name == AlarmOnOffScreen.name) {
      route = const AlarmOnOffScreen();
    }
    else if (settings.name == AllahNameScreen.name) {
      route = const AllahNameScreen();
    }    else if (settings.name == DuaPlayListScreen.name) {
      route = const DuaPlayListScreen();
    } else if (settings.name == AudioMp3Screen.name) {
      route = const AudioMp3Screen();
    }
    else if (settings.name == TasbihCountScreen.name) {
      route = const TasbihCountScreen();
    }*/
      else {
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text(" No route defined for ${settings.name}")),
        ),
      );
    }

    return MaterialPageRoute(builder: (_) => route);
  }
}
