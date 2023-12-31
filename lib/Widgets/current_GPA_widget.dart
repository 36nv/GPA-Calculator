import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrentGPAWidget extends StatelessWidget {
  const CurrentGPAWidget({
    Key? key,
    required this.currentGpaController,
  }) : super(key: key);

  final TextEditingController currentGpaController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: currentGpaController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^[0-5](\.\d{0,2})?')),
          ],
          decoration: InputDecoration(
            labelText: 'المعدل الحالي',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            suffixIcon: currentGpaController.text.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      currentGpaController.clear();
                    },
                  )
                : null,
          ),
          onChanged: (text) {
            double value = double.tryParse(text) ?? 0.0;
            if (value > 5.00) {
              currentGpaController.text = '5.00';
            }
          },
        ),
      ),
    );
  }
}
