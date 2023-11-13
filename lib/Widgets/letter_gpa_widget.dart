import 'package:flutter/material.dart';
import 'package:gpa_calculator/Colors/my_colors.dart';
import 'package:gpa_calculator/Widgets/my_text_widget.dart';

class LetterGPAWidget extends StatelessWidget {
<<<<<<< HEAD
  final String textIn;
  final double gradePoints;
  final VoidCallback onTap;

  LetterGPAWidget({
    required this.textIn,
    required this.gradePoints,
    required this.onTap,
  });
=======
  const LetterGPAWidget({
    Key? key,
    required this.textIn,
    required this.onTap,
    required this.gradePoints,
  }) : super(key: key);

  final String textIn;
  final Function() onTap;
  final double gradePoints;
>>>>>>> 8bef3b78ec79222747eb7bc11c90c9f54231a180

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
<<<<<<< HEAD
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: MyColors.secondaryColor,
          borderRadius: BorderRadius.circular(30),
=======
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: MyColors.greyColor[300],
          borderRadius: BorderRadius.circular(100),
>>>>>>> 8bef3b78ec79222747eb7bc11c90c9f54231a180
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
