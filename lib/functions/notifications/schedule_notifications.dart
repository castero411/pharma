import 'package:medicine_manager/models/medicine.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

int generateId(String name, DateTime dateTime) {
  String combined = "$name${dateTime.toIso8601String()}";
  return combined.hashCode.abs();
}
