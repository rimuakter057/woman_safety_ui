import 'package:flutter/material.dart';
import 'package:woman_safety_ui/app/utils/color/app_colors.dart';
import 'package:woman_safety_ui/app/utils/sizes/size.dart';

class ServiceCard extends StatelessWidget {
  final int index;

  const ServiceCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    // Image source based on index (this could be dynamic based on your data)
    final List<String> images = [
      'assets/images/sos_image.png',  // Replace with your image path
      'assets/images/location_image.png',
      'assets/images/alert_image.png',
      'assets/images/doctor_image.png',
      'assets/images/fire_image.png',
      'assets/images/escort_image.png',
    ];

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              images[index],
              height: size.height * 0.2,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Service ${index + 1}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
