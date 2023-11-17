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
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: MyColors.secondaryColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: MyColors.blackColor,
            width: 1,
          ),
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
