import 'package:flutter/material.dart';

class IncandDecWidget extends StatelessWidget {
  const IncandDecWidget({
    Key? key,
    required this.boxColorIncDec,
    required this.boxColor,
    required this.boxIcon,
    required this.onPressed,
  });

  final Color boxColorIncDec;
  final Color boxColor;
  final IconData boxIcon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
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
