import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:medicine_manager/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;

Future<void> scheduleNotification(
    int id, String title, String body, DateTime scheduledTime) async {
  try {
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
  } catch (e) {
    log("Error scheduling notification");
  }
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('notification_$id', scheduledTime.toIso8601String());
}

Future<void> showNotification(int id, String medicineName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? scheduledTimeString = prefs.getString('notification_$id');

  if (scheduledTimeString != null) {
    DateTime scheduledTime = DateTime.parse(scheduledTimeString);

    await flutterLocalNotificationsPlugin.show(
      id,
      'time for your medicine',
      'you have ${medicineName} to take now',
      NotificationDetails(
        android: AndroidNotificationDetails(
          'channel_id',
          'channel_name',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
  } else {
    // Handle case where there is no scheduled notification for this ID.
    print("No scheduled notification found for ID: $id");
  }
}
