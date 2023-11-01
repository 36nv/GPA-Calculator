import 'package:flutter/material.dart';
import 'package:gpa_calculator/Colors/my_colors.dart';
import 'package:gpa_calculator/Widgets/my_text_widget.dart';

class LetterGPAWidget extends StatelessWidget {
  const LetterGPAWidget({
    Key? key,
    required this.textIn,
    required this.onTap,
    required this.gradePoints,
  }) : super(key: key);

  final String textIn;
  final Function() onTap;
  final double gradePoints;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: MyColors.greyColor[300],
          borderRadius: BorderRadius.circular(100),
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
