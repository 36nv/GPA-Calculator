import 'package:flutter/material.dart';
import 'package:gpa_calculator/Colors/my_colors.dart';
import 'package:gpa_calculator/Model/course.dart';

import 'package:gpa_calculator/Widgets/inc_and_dec_widget.dart';
import 'package:gpa_calculator/Widgets/letter_gpa_widget.dart';
import 'package:gpa_calculator/Widgets/my_text_widget.dart';
import 'package:gpa_calculator/constants/spacings.dart';
import 'package:gpa_calculator/data/global_data.dart';
import 'package:gpa_calculator/extensions/screen_size.dart';

class CourseNameWidget extends StatefulWidget {
  final Course course;
  final Function onDelete;
  CourseNameWidget({
    Key? key,
    required this.course,
    required this.onDelete,
  }) : super(key: key);

  @override
  _CourseNameWidgetState createState() => _CourseNameWidgetState();
}

class _CourseNameWidgetState extends State<CourseNameWidget> {
  String selectedOption = "A+";

  void decrementCounter() {
    setState(() {
      if (widget.course.contHoursCourse > 0) {
        widget.course.contHoursCourse--;
        updateTotal(-1);

        ;
      }
    });
  }

  void incrementCounter() {
    setState(() {
      widget.course.contHoursCourse++;
      updateTotal(1);
    });
  }

  void updateTotal(
    int hours,
  ) {
    setState(() {
      totalHours += hours;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        widget.onDelete();
      },
      child: Padding(
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
                  bottomSheet(context);
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
                    textIn: widget.course.contHoursCourse.toString(),
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
                  onChanged: (value) {
                    ;
                  },
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
      ),
    );
  }

  void bottomSheet(BuildContext context) {
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
                              widget.course.selectedGradePoints = 5.0;
                              ;
                              Navigator.pop(context);
                            });
                          },
                        ),
                        LetterGPAWidget(
                          textIn: "A",
                          gradePoints: 4.75,
                          onTap: () {
                            setState(() {
                              selectedOption = "A";
                              widget.course.selectedGradePoints = 4.75;
                              ;
                              Navigator.pop(context);
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
                              widget.course.selectedGradePoints = 4.5;
                              ;
                              Navigator.pop(context);
                            });
                          },
                        ),
                        LetterGPAWidget(
                          textIn: "B",
                          gradePoints: 4,
                          onTap: () {
                            setState(() {
                              selectedOption = "B";
                              widget.course.selectedGradePoints = 4.0;
                              ;
                              Navigator.pop(context);
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
                              widget.course.selectedGradePoints = 3.5;
                              ;
                              Navigator.pop(context);
                            });
                          },
                        ),
                        LetterGPAWidget(
                          textIn: "C",
                          gradePoints: 3,
                          onTap: () {
                            setState(() {
                              selectedOption = "C";
                              widget.course.selectedGradePoints = 3;
                              ;
                              Navigator.pop(context);
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
                              widget.course.selectedGradePoints = 2.5;
                              ;
                              Navigator.pop(context);
                            });
                          },
                        ),
                        LetterGPAWidget(
                          textIn: "D",
                          gradePoints: 2,
                          onTap: () {
                            setState(() {
                              selectedOption = "D";
                              widget.course.selectedGradePoints = 2.0;
                              ;
                              Navigator.pop(context);
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
                        widget.course.selectedGradePoints = 1.0;
                        ;
                        Navigator.pop(context);
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
