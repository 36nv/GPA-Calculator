import 'package:flutter/material.dart';
import 'package:gpa_calculator/Screens/calculator_screen.dart';

int previousHours = 0;
double currentGPA = 0.00;
int contCourse = 1;
int contHoursCourse = 0;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreens(),
    );
  }
}
