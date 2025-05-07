import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woman_safety_ui/app/routes/app_routes.dart';
import 'package:woman_safety_ui/app/utils/theme/theme.dart';
import 'package:woman_safety_ui/features/HomeScreen/home_screen.dart';
import 'package:woman_safety_ui/features/auth/screens/splash_screen.dart';
import 'package:woman_safety_ui/features/chatting/screens/HomePage/home_page.dart';
import 'package:woman_safety_ui/features/main_nav_screen/main_nav_screen.dart';
import '../features/auth/screens/sign_in_screen.dart';
import '../features/auth/screens/sign_up_screen.dart';
import '../features/chatting/screens/AllChatList/user_list/user_list_screen.dart';
import 'controller_binder.dart';




class WomanSafety extends StatelessWidget {
  const WomanSafety({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(context),
      initialRoute: MainNavScreen.name,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialBinding: ControllerBinder(),
    );
  }
}
