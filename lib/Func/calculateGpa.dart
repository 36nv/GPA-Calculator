import 'package:gpa_calculator/data/global_data.dart';

class GpaCalculator {
  static double calculateGpa(int intPreviousHours, double doubleCurrentGPA) {
    final previousPoint = intPreviousHours * doubleCurrentGPA;
    final point = previousPoint + totalGrade;
    final hours = intPreviousHours + totalHours;

    final calculatedGpa = point / hours;
    return double.parse(calculatedGpa.toStringAsFixed(2));
  }

  static String calculateLetterGrade(double gpaResult) {
    if (gpaResult >= 4.75) {
      return 'A+';
    } else if (gpaResult >= 4.51) {
      return "A";
    } else if (gpaResult > 4.0) {
      return "B+";
    } else if (gpaResult > 3.5) {
      return "B";
    } else if (gpaResult > 3.0) {
      return "C+";
    } else if (gpaResult > 2.5) {
      return "C";
    } else if (gpaResult > 2.0) {
      return "D+";
    } else if (gpaResult > 1.0) {
      return "D";
    } else {
      return "F";
    }
  }
}
