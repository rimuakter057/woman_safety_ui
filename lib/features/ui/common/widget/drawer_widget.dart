import 'package:flutter/material.dart';
import 'package:woman_safety_ui/app/utils/color/app_colors.dart';
import 'package:woman_safety_ui/features/ui/common/widget/custom_divider.dart';

class DrawerWidget extends StatelessWidget {
  final String userName;
  final String userEmail;
  final VoidCallback? onMessagesTap;
  final VoidCallback? onProfileTap;
  final VoidCallback? onSettingsTap;
  final VoidCallback? onLogoutTap;

  const DrawerWidget({
    super.key,
    required this.userName,
    required this.userEmail,
    this.onMessagesTap,
    this.onProfileTap,
    this.onSettingsTap,
    this.onLogoutTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.filled,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                userName,
                style: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              accountEmail: Text(
                userEmail,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.red.shade900,
                  size: 40,
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.pink,
              ),
            ),
            _buildDrawerItem(
              icon: Icons.message,
              text: "Anonymous Alert",
              onTap: onMessagesTap ?? () => Navigator.pop(context),
            ),
            _buildDrawerItem(
              icon: Icons.person,
              text: "Safe Walk Tracking	",
              onTap: onProfileTap ?? () => Navigator.pop(context),
            ),
            _buildDrawerItem(
              icon: Icons.settings,
              text: "Settings",
              onTap: onSettingsTap ?? () => Navigator.pop(context),
            ),
           CustomDivider(),
            _buildDrawerItem(
              icon: Icons.logout,
              text: "Logout",
              onTap: onLogoutTap ?? () => Navigator.pop(context),
            ),
            _buildDrawerItem(
              icon: Icons.logout,
              text: "Self Defense Videos",
              onTap: onLogoutTap ?? () => Navigator.pop(context),
            ),

            _buildDrawerItem(
              icon: Icons.logout,
              text: "Logout",
              onTap: onLogoutTap ?? () => Navigator.pop(context),
            ),

            _buildDrawerItem(
              icon: Icons.logout,
              text: "Safety News	",
              onTap: onLogoutTap ?? () => Navigator.pop(context),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.black,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      horizontalTitleGap: 10,
    );
  }
}
