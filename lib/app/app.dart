import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woman_safety_ui/app/routes/app_routes.dart';
import 'package:woman_safety_ui/app/utils/theme/theme.dart';
import 'package:woman_safety_ui/features/HomeScreen/faq_screen.dart';
import 'package:woman_safety_ui/features/main_nav_screen/main_nav_screen.dart';
import '../features/HomeScreen/home_screen.dart';
import '../features/map/ui/screens/google_map_home_screen.dart';
import '../features/number/emergency_number_screen.dart';
import '../features/sos_screen/ui/screens/trusted_contact_screen.dart';
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
