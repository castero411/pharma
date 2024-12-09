import 'package:intl/intl.dart';

String formatTime(DateTime date) {
  // Format the DateTime to "HH:mm" (24-hour time format)
  return DateFormat('HH:mm').format(date);
}
