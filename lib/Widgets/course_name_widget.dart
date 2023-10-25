import 'package:flutter/material.dart';
import 'package:gpa_calculator/Colors/my_colors.dart';
import 'package:gpa_calculator/Screens/letter_grade_screen.dart';
import 'package:gpa_calculator/Widgets/inc_and_dec_widget.dart';
import 'package:gpa_calculator/Widgets/my_text_widget.dart';
import 'package:gpa_calculator/constants/navigation.dart';
import 'package:gpa_calculator/constants/spacings.dart';
import 'package:gpa_calculator/extensions/screen_size.dart';

class CourseNameWidget extends StatefulWidget {
  final int initialContHoursCourse;

  CourseNameWidget({Key? key, required this.initialContHoursCourse})
      : super(key: key);

  @override
  _CourseNameWidgetState createState() => _CourseNameWidgetState();
}

class _CourseNameWidgetState extends State<CourseNameWidget> {
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
      }
    });
  }

  void incrementCounter() {
    setState(() {
      contHoursCourse++;
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
                LetterGradeScreen().push(context);
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
                    textIn: "A+",
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

                textDirection:
                    TextDirection.rtl, // تعيين اتجاه النص من اليمين إلى اليسار
                textAlign: TextAlign.right, // تعيين محاذاة النص إلى اليمين
                decoration: InputDecoration(
                  labelText: 'ادخل الاسم', // نص باللغة العربية
                  border: InputBorder.none, // لجعل الحقل بدون حواف
                  filled: true, // لجعل الخلفية ملونة
                  fillColor: MyColors.greyColor[300], // تعيين اللون الخلفي
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
