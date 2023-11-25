import 'package:flutter/material.dart';
import 'package:gpa_calculator/Colors/my_colors.dart';
import 'package:gpa_calculator/Model/course.dart';
import 'package:gpa_calculator/Widgets/course_name_widget.dart';
import 'package:gpa_calculator/Widgets/current_GPA_widget.dart';
import 'package:gpa_calculator/Widgets/inkwell_wedget.dart';
import 'package:gpa_calculator/Widgets/my_text_widget.dart';
import 'package:gpa_calculator/Widgets/previous_hours_widget.dart';
import 'package:gpa_calculator/constants/spacings.dart';
import 'package:gpa_calculator/data/global_data.dart';
import 'package:gpa_calculator/extensions/screen_size.dart';

class CalculatorScreens extends StatefulWidget {
  const CalculatorScreens({Key? key}) : super(key: key);

  @override
  State<CalculatorScreens> createState() => _CalculatorScreensState();
}

class _CalculatorScreensState extends State<CalculatorScreens> {
  TextEditingController previousHoursController = TextEditingController();
  TextEditingController currentGpaController = TextEditingController();

  void newCourse() {
    courseList.add(Course());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // هنا يتم إخفاء لوحة المفاتيح عند النقر في أي مكان على الشاشة
        FocusScope.of(context).unfocus();
      },
      child: WillPopScope(
        onWillPop: () async {
          FocusScope.of(context).unfocus();
          await Future.delayed(Duration(milliseconds: 200));
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xFF62D9D0),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: IconButton(
                  iconSize: 35.0,
                  onPressed: () {
                    newCourse();
                    print('List ${courseList.length}');
                  },
                  icon: Icon(
                    Icons.add,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Color(0xFF62D9D0),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyText(
                textIn: "احسب معدلك",
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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(children: [
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: courseList.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    CourseNameWidget(
                                      course: courseList[index],
                                      onDelete: () {
                                        setState(() {
                                          courseList.removeAt(index);
                                        });
                                      },
                                    ),
                                    kVSpace8,
                                  ],
                                );
                              },
                            ),
                          ]),
                        ),
                        Row(
                          children: [
                            InkWellWedget(
                                previousHoursController:
                                    previousHoursController,
                                currentGpaController: currentGpaController),
                            Container(
                              width: context.getWidth() / 2,
                              decoration: BoxDecoration(
                                color: MyColors.secondaryColor,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  PreviousHoursWidget(
                                      previousHoursController:
                                          previousHoursController),
                                  CurrentGPAWidget(
                                      currentGpaController:
                                          currentGpaController),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
