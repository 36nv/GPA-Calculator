import 'package:flutter/material.dart';
import 'package:gpa_calculator/Colors/my_colors.dart';

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.textIn,
    this.textSize = 12,
    this.textColor = MyColors.blackColor,
    this.isBold = false,
  });
  final String textIn;
  final double textSize;
  final Color textColor;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Text(
      textIn,
      style: TextStyle(
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontSize: textSize,
        color: textColor,
      ),
    );
  }
}
