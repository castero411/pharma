import 'package:medicine_manager/functions/notifications/add_notifications.dart';
import 'package:medicine_manager/models/medicine.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

void checkForScheduleNotifications(List<Medicine> medicineList) async {
  for (Medicine medicine in medicineList) {
    for (var entry in medicine.takenDate.entries) {
      for (var entryX in entry.value.entries) {
        if (!entryX.value) {
          int id = generateId(entry.key, entryX.key, medicine.name);
          if (!await checkNotificationWithId(id) ||
              !(isNotInTheFuture(parseTime(entry.key, entryX.key)))) {
            await scheduleNotification(
                id,
                "time for your medicine",
                "you have ${medicine.name} to take now",
                parseTime(entry.key, entryX.key));
          }
        }
      }
    }
  }
}

bool isNotInTheFuture(DateTime date) {
  return date.isBefore(DateTime.now()) || date.isAtSameMomentAs(DateTime.now());
}

DateTime parseTime(String date, String time) {
  String dateTimeString = "$date $time";
  DateFormat format = DateFormat("yyyy-MM-dd hh:mm a");
  return format.parse(dateTimeString);
}

Future<bool> checkNotificationWithId(int id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? scheduledTime = prefs.getString('notification_$id');
  if (scheduledTime == null) return false;

  DateTime scheduledDateTime = DateTime.parse(scheduledTime);
  return scheduledDateTime.isAfter(DateTime.now());
}

int generateId(String date, String time, String name) {
  // Combine date, time, and name into one unique string
  String combined = "$date$time$name";
  // Generate a hash code and ensure it's positive
  return combined.hashCode.abs();
}
