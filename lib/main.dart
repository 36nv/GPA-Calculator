import 'package:flutter/material.dart';
import 'package:gpa_calculator/Screens/calculator_screen.dart';
import 'package:gpa_calculator/Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
