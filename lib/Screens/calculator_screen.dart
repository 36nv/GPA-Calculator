import 'package:flutter/material.dart';
import 'package:gpa_calculator/Colors/my_colors.dart';
import 'package:gpa_calculator/Widgets/add_widget.dart';
import 'package:gpa_calculator/Widgets/course_name_widget.dart';
import 'package:gpa_calculator/Widgets/my_text_widget.dart';
import 'package:gpa_calculator/constants/spacings.dart';
import 'package:gpa_calculator/extensions/screen_size.dart';
import 'package:gpa_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorScreens extends StatefulWidget {
  const CalculatorScreens({Key? key}) : super(key: key);

  @override
  State<CalculatorScreens> createState() => _CalculatorScreensState();
}

class _CalculatorScreensState extends State<CalculatorScreens> {
  TextEditingController currentGpaController = TextEditingController();

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
                child: Column(
                  children: [
                    Expanded(
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
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: context.getWidth() / 2,
                            height: 100,
                            decoration: BoxDecoration(
                              color: MyColors.primaryColor,
                            ),
                            child: Center(
                              child: MyText(
                                textIn: "احسب",
                                textSize: 25,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: context.getWidth() / 2,
                          decoration: BoxDecoration(
                            color: MyColors.secondaryColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(4),
                                    ],
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      labelText: ' الساعات السابقة',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: currentGpaController,
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                            decimal: true),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'^[0-5](\.\d{0,2})?')),
                                    ],
                                    decoration: InputDecoration(
                                      labelText: 'المعدل الحالي',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    onChanged: (text) {
                                      double value =
                                          double.tryParse(text) ?? 0.0;
                                      if (value > 5.00) {
                                        currentGpaController.text = '5.00';
                                      }
                                    },
                                  ),
                                ),
                              ),
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
    );
  }
}
