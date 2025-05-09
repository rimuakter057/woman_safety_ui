import 'package:flutter/material.dart';

import '../../../../../app/utils/color/app_colors.dart';


class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BottomNavigationBar(
      backgroundColor: AppColors.secondaryPrimaryColor,
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor:AppColors.white,
      selectedFontSize: screenWidth * 0.035,
      unselectedFontSize: screenWidth * 0.03,
      iconSize: screenWidth * 0.07,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.alarm),
          label: "sos",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.verified_user),
          label: "user",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "profile",
        ),
      ],
    );
  }
}
