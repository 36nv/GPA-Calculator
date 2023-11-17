import 'package:flutter/material.dart';
import 'package:gpa_calculator/Colors/my_colors.dart';
import 'package:gpa_calculator/Func/calculateGpa.dart';
import 'package:gpa_calculator/Widgets/my_text_widget.dart';
import 'package:gpa_calculator/constants/spacings.dart';
import 'package:gpa_calculator/data/global_data.dart';
import 'package:gpa_calculator/extensions/screen_size.dart';

class GPAScreen extends StatefulWidget {
  final String previousHours;
  final String currentGPA;

  GPAScreen({required this.previousHours, required this.currentGPA});

  @override
  _GPAScreenState createState() => _GPAScreenState();
}

class _GPAScreenState extends State<GPAScreen> {
  late int intPreviousHours;
  late double doubleCurrentGPA;
  late double gpaResult;
  late String gpaLetter;

  @override
  void initState() {
    super.initState();
    intPreviousHours = int.parse(widget.previousHours);
    doubleCurrentGPA = double.parse(widget.currentGPA);
    calculateGpa();
  }

  void calculateGpa() {
    setState(() {
      gpaResult =
          GpaCalculator.calculateGpa(intPreviousHours, doubleCurrentGPA);
      gpaLetter = GpaCalculator.calculateLetterGrade(gpaResult);
    });
  }

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
            textIn: "درجتك الحالية",
            textSize: 30,
            isBold: true,
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
              child: Column(
                children: [
                  kVSpace64,
                  MyText(
                    textIn: " معدلك الحالي $gpaResult ",
                    textSize: 30,
                    isBold: true,
                  ),
                  kVSpace24,
                  kVSpace16,
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: MyColors.secondaryColor,
                      border: Border.all(
                        color: MyColors.blackColor,
                        width: 3,
                      ),
                    ),
                    child: Center(
                      child: MyText(
                        textIn: "$gpaLetter",
                        textSize: 150,
                        textColor: MyColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
