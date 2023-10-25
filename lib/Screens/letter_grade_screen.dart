import 'package:flutter/material.dart';
import 'package:gpa_calculator/Colors/my_colors.dart';
import 'package:gpa_calculator/Widgets/my_text_widget.dart';
import 'package:gpa_calculator/constants/navigation.dart';
import 'package:gpa_calculator/constants/spacings.dart';
import 'package:gpa_calculator/extensions/screen_size.dart';

class LetterGradeScreen extends StatelessWidget {
  const LetterGradeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF62D9D0),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
          ),
        ],
      ),
      backgroundColor: Color(0xFF62D9D0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyText(
            textIn: "اختر الدرجة",
            textSize: 30,
          ),
          kVSpace12,
          Expanded(
            child: Container(
              width: context.getWidth(),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: Column(children: [
                kVSpace32,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LetterGPAWidget(
                        textIn: "A+",
                        gradePoints: 5,
                      ),
                      LetterGPAWidget(
                        textIn: "A",
                        gradePoints: 4.75,
                      ),
                    ],
                  ),
                ),
                kVSpace32,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LetterGPAWidget(
                        textIn: "B+",
                        gradePoints: 4.5,
                      ),
                      LetterGPAWidget(
                        textIn: "B",
                        gradePoints: 4,
                      ),
                    ],
                  ),
                ),
                kVSpace32,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LetterGPAWidget(
                        textIn: "C+",
                        gradePoints: 3.5,
                      ),
                      LetterGPAWidget(
                        textIn: "C",
                        gradePoints: 3,
                      ),
                    ],
                  ),
                ),
                kVSpace32,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LetterGPAWidget(
                        textIn: "D+",
                        gradePoints: 2.5,
                      ),
                      LetterGPAWidget(
                        textIn: "D",
                        gradePoints: 2,
                      ),
                    ],
                  ),
                ),
                kVSpace16,
                LetterGPAWidget(
                  textIn: "F",
                  gradePoints: 1,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class LetterGPAWidget extends StatelessWidget {
  const LetterGPAWidget({
    super.key,
    required this.textIn,
    required this.gradePoints,
  });
  final String textIn;
  final double gradePoints;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pop;
      },
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
