import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppGradients {
  AppGradients._(); // Private constructor to prevent instantiation


static LinearGradient buttonGradient =  LinearGradient(
  colors: [AppColors.red, AppColors.pink],
  begin: Alignment(-0.66, -0.66),
  end: Alignment(1.0, 1.0),
);

}
