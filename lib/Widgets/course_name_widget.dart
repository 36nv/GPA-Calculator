import 'package:flutter/material.dart';
import 'package:gpa_calculator/Colors/my_colors.dart';
import 'package:gpa_calculator/Screens/calculator_screen.dart';
import 'package:gpa_calculator/Screens/gpa_screen.dart';
import 'package:gpa_calculator/Widgets/inc_and_dec_widget.dart';
import 'package:gpa_calculator/Widgets/letter_gpa_widget.dart';
import 'package:gpa_calculator/Widgets/my_text_widget.dart';
import 'package:gpa_calculator/constants/navigation.dart';
import 'package:gpa_calculator/constants/spacings.dart';
import 'package:gpa_calculator/extensions/screen_size.dart';

double selectedGradePoints = 5.0;

class CourseNameWidget extends StatefulWidget {
  final int initialContHoursCourse;
  CourseNameWidget({
    Key? key,
    required this.initialContHoursCourse,
  }) : super(key: key);

  @override
  _CourseNameWidgetState createState() => _CourseNameWidgetState();
}

class _CourseNameWidgetState extends State<CourseNameWidget> {
  String selectedOption = "A+"; // Initialize with a default value
  int contHoursCourse = 0;

  @override
  void initState() {
    super.initState();
    contHoursCourse = widget.initialContHoursCourse;
  }

  void decrementCounter() {
    setState(() {
      if (contHoursCourse > 0) {
        contHoursCourse--;
        updateTotal(-1, selectedGradePoints); // تقليل ساعة واحدة
      }
    });
  }

  void incrementCounter() {
    setState(() {
      contHoursCourse++;
      updateTotal(1, selectedGradePoints); // زيادة ساعة واحدة
    });
  }

  void updateTotal(int hours, double grade) {
    setState(() {
      totalHours += hours;
      totalGradePoints += selectedGradePoints;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        width: context.getWidth(),
        height: context.getHeight() / 10,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                openBottomSheet(context);
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: MyColors.secondaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: MyText(
                    textIn: selectedOption,
                    textSize: 20,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                IncandDecWidget(
                  boxColorIncDec: MyColors.secondaryColor,
                  boxColor: MyColors.primaryColor,
                  boxIcon: Icons.remove,
                  onPressed: decrementCounter,
                ),
                kHSpace12,
                MyText(
                  textIn: contHoursCourse.toString(),
                  textSize: 20,
                ),
                kHSpace12,
                IncandDecWidget(
                  boxColorIncDec: MyColors.secondaryColor,
                  boxColor: MyColors.primaryColor,
                  boxIcon: Icons.add,
                  onPressed: incrementCounter,
                ),
              ],
            ),
            SizedBox(
              width: 150,
              child: TextField(
                autofocus: true,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  labelText: 'ادخل الاسم',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: MyColors.greyColor[300],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  kVSpace32,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LetterGPAWidget(
                          textIn: "A+",
                          gradePoints: 5,
                          onTap: () {
                            setState(() {
                              selectedOption = "A+";
                              selectedGradePoints = 5.0;

                              context.pop;
                            });
                          },
                        ),
                        LetterGPAWidget(
                          textIn: "A",
                          gradePoints: 4.75,
                          onTap: () {
                            setState(() {
                              selectedOption = "A";
                              selectedGradePoints = 4.75;
                              context.pop;
                            });
                          },
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
                          onTap: () {
                            setState(() {
                              selectedOption = "B+";
                              selectedGradePoints = 4.5;
                              context.pop;
                            });
                          },
                        ),
                        LetterGPAWidget(
                          textIn: "B",
                          gradePoints: 4,
                          onTap: () {
                            setState(() {
                              selectedOption = "B";
                              selectedGradePoints = 4.0;
                              context.pop;
                            });
                          },
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
                          onTap: () {
                            setState(() {
                              selectedOption = "C+";
                              selectedGradePoints = 3.5;
                              context.pop;
                            });
                          },
                        ),
                        LetterGPAWidget(
                          textIn: "C",
                          gradePoints: 3,
                          onTap: () {
                            setState(() {
                              selectedOption = "C";
                              selectedGradePoints = 3;
                              context.pop;
                            });
                          },
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
                          onTap: () {
                            setState(() {
                              selectedOption = "D+";
                              selectedGradePoints = 2.5;
                              context.pop;
                            });
                          },
                        ),
                        LetterGPAWidget(
                          textIn: "D",
                          gradePoints: 2,
                          onTap: () {
                            setState(() {
                              selectedOption = "D";
                              selectedGradePoints = 2.0;
                              context.pop;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  kVSpace16,
                  LetterGPAWidget(
                    textIn: "F",
                    gradePoints: 1,
                    onTap: () {
                      setState(() {
                        selectedOption = "F";
                        selectedGradePoints = 1.0;
                        context.pop;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
