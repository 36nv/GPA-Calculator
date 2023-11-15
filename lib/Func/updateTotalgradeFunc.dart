import 'package:gpa_calculator/data/global_data.dart';

void updateTotalgrade() {
  totalGrade = 0;
  for (var element in courseList) {
    totalGrade += element.selectedGradePoints * element.contHoursCourse;
  }
}
