import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FoodRAYApp());
}

class FoodRAYApp extends StatelessWidget {
  const FoodRAYApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodRAY',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Homepage(),
    );
  }
}
