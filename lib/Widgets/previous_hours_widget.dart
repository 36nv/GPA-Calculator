import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PreviousHoursWidget extends StatelessWidget {
  const PreviousHoursWidget({
    super.key,
    required this.previousHoursController,
  });

  final TextEditingController previousHoursController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: previousHoursController,
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
    );
  }
}
