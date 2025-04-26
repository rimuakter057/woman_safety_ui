import 'package:flutter/material.dart';
import 'package:woman_safety_ui/features/ui/screens/sos_screen/sos_screen.dart';

import '../../features/ui/screens/auth/screens/confirmed_password_screen.dart';
import '../../features/ui/screens/auth/screens/forget_password_screen.dart';
import '../../features/ui/screens/auth/screens/otp_send_screen.dart';
import '../../features/ui/screens/auth/screens/otp_verify_screen.dart';
import '../../features/ui/screens/auth/screens/password_change_screen.dart';
import '../../features/ui/screens/auth/screens/sign_in_screen.dart';
import '../../features/ui/screens/auth/screens/sign_up_screen.dart';
import '../../features/ui/screens/main_nav_screen/main_nav_screen.dart';
import '../../features/ui/screens/profile/screens/change_password_screen.dart';
import '../../features/ui/screens/profile/screens/edit_profile_screen.dart';
import '../../features/ui/screens/profile/screens/profile_screen.dart';
import '../../features/ui/screens/setting/screens/help_center_screen.dart';
import '../../features/ui/screens/setting/screens/privacy_policy_screen.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    debugPrint("Route requested: ${settings.name}");

    late Widget route;

    if (settings.name == MainNavScreen.name) {
      route = const MainNavScreen();
    }
/*     else if (settings.name == SplashScreen.name) {
      route = const SplashScreen();
    }*/
    else if (settings.name == SignInScreen.name) {
      route =  SignInScreen();
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
