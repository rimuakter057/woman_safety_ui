import 'package:flutter/material.dart';

import '../../../app/utils/color/app_colors.dart';
class AppBarLeadingWidget extends StatelessWidget {
  const AppBarLeadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.white,
        ));
  }
}
