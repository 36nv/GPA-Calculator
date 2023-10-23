import 'package:flutter/material.dart';
import 'package:gpa_calculator/Widgets/inc_and_dec_widget.dart';
import 'package:gpa_calculator/Widgets/my_text_widget.dart';
import 'package:gpa_calculator/constants/spacings.dart';
import 'package:gpa_calculator/extensions/screen_size.dart';

class AddWidget extends StatelessWidget {
  const AddWidget({
    Key? key,
    required this.boxColor,
    required this.textColor,
    required this.boxColorIncDec,
    required this.request,
    required this.response,
    required this.onPressedIncrement,
    required this.onPressedDecrement,
  }) : super(key: key);

  final Color boxColor;
  final Color textColor;
  final Color boxColorIncDec;
  final String request;
  final num response;
  final VoidCallback onPressedIncrement;
  final VoidCallback onPressedDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth() / 2,
      height: context.getHeight() / 10,
      decoration: BoxDecoration(
        color: boxColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(
            textIn: request,
            textColor: textColor,
          ),
          kVSpace8,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              IncandDecWidget(
                boxColorIncDec: boxColorIncDec,
                boxColor: boxColor,
                boxIcon: Icons.remove,
                onPressed: onPressedDecrement,
              ),
              kHSpace8,
              MyText(
                textIn: response.toString(),
                textColor: textColor,
              ),
              kHSpace8,
              IncandDecWidget(
                boxColorIncDec: boxColorIncDec,
                boxColor: boxColor,
                boxIcon: Icons.add,
                onPressed: onPressedIncrement,
              ),
            ],
          )
        ],
      ),
    );
  }
}
