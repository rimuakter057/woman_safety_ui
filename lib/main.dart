import 'package:flutter/material.dart';

import 'app/view/HomePage/home_page.dart';
import 'app/view/LocationPage/location_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:LocationPage(),
    );
  }
}


