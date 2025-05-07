import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check if Firebase is already initialized
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform.copyWith(
        databaseURL: 'https://womansafety-ffe4c-default-rtdb.firebaseio.com',
      ),
    );
  } catch (e) {
    print('Firebase initialization error: $e');
  }
  runApp(const WomanSafety());
}


