import 'package:flutter/material.dart';
import 'package:gpa_calculator/Colors/my_colors.dart';

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.textIn,
    this.textSize = 12,
    this.textColor = MyColors.blackColor,
  });
  final String textIn;
  final double textSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      textIn,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: textSize,
        color: textColor,
      ),
    );
  }
}
