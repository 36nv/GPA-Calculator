import 'package:flutter/material.dart';
import 'package:gpa_calculator/Widgets/course_name_widget.dart';
import 'package:gpa_calculator/Widgets/my_text_widget.dart';
import 'package:gpa_calculator/constants/spacings.dart';
import 'package:gpa_calculator/extensions/screen_size.dart';

int totalHours = 0;
double totalGradePoints = 0.0;

class GPAScreen extends StatelessWidget {
  const GPAScreen({Key? key}) : super(key: key);

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
                  kHSpace32,
                  Text("مجموع الساعات: $totalHours"),
                  Text(
                      "مجموع القريد: $totalGradePoints"), // Display totalGradePoints
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
