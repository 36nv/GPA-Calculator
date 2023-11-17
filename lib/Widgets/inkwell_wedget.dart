import 'package:flutter/material.dart';
import 'package:gpa_calculator/Colors/my_colors.dart';
import 'package:gpa_calculator/Screens/gpa_screen.dart';
import 'package:gpa_calculator/Widgets/my_text_widget.dart';
import 'package:gpa_calculator/constants/navigation.dart';
import 'package:gpa_calculator/data/global_data.dart';
import 'package:gpa_calculator/extensions/screen_size.dart';

import '../Func/updateTotalgradeFunc.dart';

class InkWellWedget extends StatelessWidget {
  const InkWellWedget({
    super.key,
    required this.previousHoursController,
    required this.currentGpaController,
  });

  final TextEditingController previousHoursController;
  final TextEditingController currentGpaController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (courseList.any((course) => course.contHoursCourse < 1)) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                title: Center(
                  child: MyText(
                    textIn: 'فضلا أضف عدد الساعات',
                    textSize: 20,
                  ),
                ),
              );
            },
          );
        } else {
          FocusScope.of(context).unfocus(); // إغلاق لوحة المفاتيح

          Future.delayed(Duration(milliseconds: 200), () {
            updateTotalgrade();
            String previousHoursText = previousHoursController.text;
            String currentGpaText = currentGpaController.text;

            if (previousHoursText.isEmpty) {
              previousHoursText = '0';
            }
            if (currentGpaText.isEmpty) {
              currentGpaText = '0.00';
            }

            GPAScreen(
              previousHours: previousHoursText,
              currentGPA: currentGpaText,
            ).push(context);
          });
        }
      },
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
    );
  }
}
