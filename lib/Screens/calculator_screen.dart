import 'package:flutter/material.dart';
import 'package:gpa_calculator/Colors/my_colors.dart';
import 'package:gpa_calculator/Widgets/add_widget.dart';
import 'package:gpa_calculator/Widgets/course_name_widget.dart';
import 'package:gpa_calculator/Widgets/my_text_widget.dart';
import 'package:gpa_calculator/constants/spacings.dart';
import 'package:gpa_calculator/extensions/screen_size.dart';
import 'package:gpa_calculator/main.dart';

class CalculatorScreens extends StatefulWidget {
  const CalculatorScreens({Key? key}) : super(key: key);

  @override
  State<CalculatorScreens> createState() => _CalculatorScreensState();
}

class _CalculatorScreensState extends State<CalculatorScreens> {
  void increasePreviousHours() {
    setState(() {
      previousHours++;
    });
  }

  void addCourse() {
    setState(() {
      contCourse++;
    });
  }

  void decreasePreviousHours() {
    setState(() {
      if (previousHours > 0) {
        previousHours--;
      }
    });
  }

  void increaseCurrentGPA() {
    setState(() {
      if (currentGPA < 5.00) {
        currentGPA = (currentGPA + 0.01).clamp(0.00, 5.00);
        currentGPA = double.parse(currentGPA.toStringAsFixed(2));
      }
    });
  }

  void decreaseCurrentGPA() {
    setState(() {
      if (currentGPA > 0.00) {
        currentGPA = (currentGPA - 0.01).clamp(0.00, 5.00);
        currentGPA = double.parse(currentGPA.toStringAsFixed(2));
      }
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
            child: IconButton(
                iconSize: 35.0,
                onPressed: () {
                  addCourse();
                },
                icon: Icon(
                  Icons.add,
                )),
          )
        ],
      ),
      backgroundColor: Color(0xFF62D9D0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyText(
            textIn: "حساب المعدل",
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
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListView(
                  children: List.generate(contCourse, (index) {
                    return Column(
                      children: [
                        CourseNameWidget(),
                        kVSpace8,
                      ],
                    );
                  }),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  AddWidget(
                    boxColor: MyColors.primaryColor,
                    textColor: MyColors.secondaryColor,
                    boxColorIncDec: MyColors.secondaryColor,
                    request: 'الساعات السابقة',
                    response: previousHours,
                    onPressedIncrement: increasePreviousHours,
                    onPressedDecrement: decreasePreviousHours,
                  ),
                  AddWidget(
                    boxColor: MyColors.secondaryColor,
                    textColor: MyColors.blackColor,
                    boxColorIncDec: MyColors.primaryColor,
                    request: 'المعدل الحالي',
                    response: currentGPA,
                    onPressedIncrement: increaseCurrentGPA,
                    onPressedDecrement: decreaseCurrentGPA,
                  ),
                ],
              ),
            ],
          ),
          kVSpace8,
          InkWell(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 50,
              child: Center(
                child: MyText(
                  textIn: "احسب",
                ),
              ),
              decoration: BoxDecoration(
                  color: MyColors.secondaryColor,
                  borderRadius: BorderRadius.circular(50)),
            ),
          )
        ],
      ),
    );
  }
}
