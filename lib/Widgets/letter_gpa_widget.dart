import 'package:flutter/material.dart';
import 'package:gpa_calculator/Colors/my_colors.dart';
import 'package:gpa_calculator/Widgets/my_text_widget.dart';

class LetterGPAWidget extends StatelessWidget {
  final String textIn;
  final double gradePoints;
  final VoidCallback onTap;

  LetterGPAWidget({
    required this.textIn,
    required this.gradePoints,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: MyColors.secondaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: MyText(
            textIn: textIn,
            textSize: 20,
          ),
        ),
      ),
    );
  }
}
