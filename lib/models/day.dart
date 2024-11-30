import 'package:medicine_manager/models/med_time.dart';

class Day {
  final String date;
  final String day;
  final List<MedicineTime> medicineList;

  const Day(this.day, {required this.date, required this.medicineList});
}
