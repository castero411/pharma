import 'package:medicine_manager/functions/alarm/create_alarm.dart';
import 'package:medicine_manager/functions/time/date_to_string.dart';
import 'package:medicine_manager/functions/time/time_to_string.dart';
import 'package:medicine_manager/models/medicine.dart';

Medicine createMedicineWithTakenDates({
  required String name,
  required String description,
  required String type,
  required String dose,
  required String doseNumber,
  required DateTime startingDate,
}) {
  // Parse doseNumber to an integer
  final int doseCount = int.tryParse(doseNumber) ?? 0;
  if (doseCount <= 0) {
    throw ArgumentError("Dose must be a positive integer.");
  }

  // Initialize takenDate map as Map<String, Map<String, bool>>
  final Map<String, Map<String, bool>> initializedTakenDates = {};

  for (int i = 0; i < doseCount; i++) {
    DateTime date = startingDate.add(Duration(days: i));
    String formattedDate = formatDate(date);
    String time = formatTime(startingDate);

    // Ensure the nested map is properly initialized
    if (!initializedTakenDates.containsKey(formattedDate)) {
      initializedTakenDates[formattedDate] = {};
    }
    initializedTakenDates[formattedDate]![time] = false;
    createAlarm(name, formattedDate, time, date);
  }

  // Return the Medicine instance
  return Medicine(
    name: name,
    description: description,
    type: type,
    dose: dose,
    doseCount: doseNumber,
    startingDate: startingDate,
    takenDate: initializedTakenDates,
  );
}

Medicine createMedicineWithTakenHours({
  required String name,
  required String description,
  required String type,
  required String dose,
  required String doseNumber,
  required DateTime startingDate,
  required String hours,
}) {
  // Parse doseNumber and hours to integers
  final int doseCount = int.tryParse(doseNumber) ?? 0;
  if (doseCount <= 0) {
    throw ArgumentError("Dose number must be a positive integer.");
  }

  final double hourGap = double.tryParse(hours) ?? 0;
  if (hourGap <= 0) {
    throw ArgumentError("Hours gap must be a positive integer.");
  }

  // Initialize takenDate map as Map<String, Map<String, bool>>
  final Map<String, Map<String, bool>> initializedTakenDates = {};

  double number = 0;

  for (int i = 0; i < doseCount; i++) {
    var newTimer = convertToHourMinute(number);
    DateTime date =
        startingDate.add(Duration(hours: newTimer.$1, minutes: newTimer.$2));
    String formattedDate = formatDate(date);
    String time = formatTime(date); // Use the incremented date here

    number += hourGap;
    // Efficiently initialize nested map
    initializedTakenDates.putIfAbsent(formattedDate, () => {});
    initializedTakenDates[formattedDate]![time] = false;
    createAlarm(name, formattedDate, time, date);
  }

  // Return the Medicine instance
  return Medicine(
    name: name,
    description: description,
    type: type,
    dose: dose,
    doseCount: doseNumber,
    startingDate: startingDate,
    takenDate: initializedTakenDates,
  );
}

(int hour, int minutes) convertToHourMinute(double time) {
  int hour = time.floor();
  int minute = ((time - hour) * 60).round();
  return (hour, minute);
}
