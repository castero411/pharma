import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:medicine_manager/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;

Future<void> scheduleNotification(
    int id, String title, String body, DateTime scheduledTime) async {
  await flutterLocalNotificationsPlugin.zonedSchedule(
    id,
    title,
    body,
    tz.TZDateTime.from(scheduledTime, tz.local),
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'your_channel_id',
        'your_channel_name',
        importance: Importance.max,
        priority: Priority.high,
      ),
    ),
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('notification_$id', scheduledTime.toIso8601String());
}
