import 'dart:io';

import 'package:alarm/alarm.dart';
import 'package:alarm/model/volume_settings.dart';
import 'package:medicine_manager/functions/notifications/schedule_notifications.dart';
import 'package:medicine_manager/functions/time/date_to_string.dart';
import 'package:medicine_manager/functions/time/time_to_string.dart';

final alarmSettings = AlarmSettings(
  id: 42,
  dateTime: DateTime.now().copyWith(minute: 34),
  assetAudioPath: 'assets/alarm.mp3',
  loopAudio: true,
  vibrate: true,
  warningNotificationOnKill: Platform.isAndroid,
  androidFullScreenIntent: true,
  volumeSettings: VolumeSettings.fixed(
    volume: 0.8,
    volumeEnforced: false,
  ),
  notificationSettings: const NotificationSettings(
    title: 'Time for your medicine',
    body: 'You have a medicine to take now',
    stopButton: 'Stop the alarm',
    icon: 'notification_icon',
  ),
);

Future<void> createAlarm(String medicineName, String date, String time,
    String description, DateTime medicineTime) async {
  List<AlarmSettings> alarms = await Alarm.getAlarms();
  DateTime timeLimit = medicineTime.add(Duration(minutes: 5));

  for (var alarm in alarms) {
    if (medicineTime.isAfter(alarm.dateTime) &&
        medicineTime.isBefore(timeLimit) &&
        alarm.id != generateId(medicineName, date, time)) {
      await Alarm.set(
          alarmSettings: alarmSettings.copyWith(
        dateTime: medicineTime,
        id: generateId(medicineName, date, time),
        notificationSettings: NotificationSettings(
          title: '${alarm.notificationSettings.title} and $medicineName',
          body: '${alarm.notificationSettings.body} \n $description',
          stopButton: 'Stop the alarm',
          icon: 'notification_icon',
        ),
      ));

      Alarm.stop(alarm.id);
      return;
    }
  }

  if (medicineTime.isAfter(DateTime.now())) {
    await Alarm.set(
        alarmSettings: alarmSettings.copyWith(
      dateTime: medicineTime,
      id: generateId(medicineName, date, time),
      notificationSettings: NotificationSettings(
        title: 'Time for $medicineName',
        body: description,
        stopButton: 'Stop the alarm',
        icon: 'notification_icon',
      ),
    ));
  }

  //print(Alarm.scheduled);
}

Future<void> reEnableAlarm(
    String medicineName, String date, String time) async {
  DateTime newDate = parseDate(date);
  var (hour, minute) = parseTimeFormat(time);

  // Combine newDate with parsed time
  DateTime medicineTime = DateTime(
    newDate.year,
    newDate.month,
    newDate.day,
    hour,
    minute,
  );

  if (medicineTime.isAfter(DateTime.now())) {
    await Alarm.set(
        alarmSettings: alarmSettings.copyWith(
            dateTime: medicineTime, id: generateId(medicineName, date, time)));
  }
}
