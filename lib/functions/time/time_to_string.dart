import 'package:intl/intl.dart';

String formatTime(DateTime date) {
  // Format the DateTime to "hh:mm a" (12-hour time format with AM/PM)
  return DateFormat('hh:mm a').format(date);
}

(int, int) parseTimeFormat(String time) {
  DateTime dateTime = DateFormat('hh:mm a').parse(time);
  return (dateTime.hour, dateTime.minute);
}
