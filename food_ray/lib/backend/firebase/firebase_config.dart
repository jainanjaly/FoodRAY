import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBzajAhviO_lz6occ3Jd0Zu0FNPp5FJHUI",
            authDomain: "food-ray-uj52fo.firebaseapp.com",
            projectId: "food-ray-uj52fo",
            storageBucket: "food-ray-uj52fo.firebasestorage.app",
            messagingSenderId: "556013285510",
            appId: "1:556013285510:web:50fc4f00d5465afe01a107"));
  } else {
    await Firebase.initializeApp();
  }
}
