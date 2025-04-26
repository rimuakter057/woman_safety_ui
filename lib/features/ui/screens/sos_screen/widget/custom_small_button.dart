import 'package:flutter/material.dart';
import '../../../../../app/utils/color/app_colors.dart';

class CustomSmallButton extends StatelessWidget {
  final String label;
  final double width;
  final VoidCallback onPressed;

  const CustomSmallButton({super.key, required this.label, required this.width, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
