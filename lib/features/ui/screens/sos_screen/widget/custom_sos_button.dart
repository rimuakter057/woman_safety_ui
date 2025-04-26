import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import '../../../../../app/utils/color/app_colors.dart';

class CustomSOSButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double buttonSize;

  const CustomSOSButton({super.key, required this.onPressed, required this.buttonSize});

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      glowCount: 3,
      glowColor: AppColors.red,
      glowShape: BoxShape.circle,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: const CircleBorder(),
          padding: EdgeInsets.all(buttonSize * 0.25),
        ),
        child: Text(
          'SOS',
          style: TextStyle(
            fontSize: buttonSize * 0.2,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
