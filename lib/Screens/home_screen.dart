import 'package:flutter/material.dart';
import 'package:gpa_calculator/Colors/my_colors.dart';
import 'package:gpa_calculator/Screens/calculator_screen.dart';
import 'package:gpa_calculator/Screens/contact_us.dart';
import 'package:gpa_calculator/Widgets/my_text_widget.dart';
import 'package:gpa_calculator/constants/navigation.dart';
import 'package:gpa_calculator/constants/spacings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  textIn: "حاسبة المعدل",
                  textSize: 50,
                  isBold: true,
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          kVSpace64,
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                color: MyColors.secondaryColor,
                border: Border.all(
                  color: MyColors.blackColor,
                  width: 3,
                ),
              ),
              child: Center(
                  child: Transform.rotate(
                angle: -15 * 3.141592653589793 / 180,
                child: Text(
                  "A+",
                  style: TextStyle(fontSize: 150),
                ),
              )),
            ),
          ),
          kVSpace64,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              kHSpace12,
              InkWell(
                onTap: () => ContactUs().push(context),
                child: Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    color: MyColors.primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: MyText(
                      textIn: "تواصل معنا",
                      textSize: 30,
                      isBold: true,
                      textColor: MyColors.secondaryColor,
                    ),
                  ),
                ),
              ),
              kHSpace12,
              InkWell(
                onTap: () => CalculatorScreens().push(context),
                child: Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    color: MyColors.primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: MyText(
                      textIn: "احسب الأن",
                      textSize: 30,
                      isBold: true,
                      textColor: MyColors.secondaryColor,
                    ),
                  ),
                ),
              ),
              kHSpace12,
            ],
          )
        ],
      ),
    );
  }
}
