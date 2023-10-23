import 'package:flutter/material.dart';

class IncandDecWidget extends StatelessWidget {
  const IncandDecWidget({
    Key? key,
    required this.boxColorIncDec,
    required this.boxColor,
    required this.boxIcon,
    required this.onPressed, // Add the onPressed parameter
  });

  final Color boxColorIncDec;
  final Color boxColor;
  final IconData boxIcon;
  final VoidCallback onPressed; // Define the onPressed callback

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed, // Call the onPressed callback when the widget is tapped
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: boxColorIncDec,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          boxIcon,
          color: boxColor,
        ),
      ),
    );
  }
}
