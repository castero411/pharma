import 'dart:io';

import 'package:alarm/alarm.dart';
import 'package:alarm/model/volume_settings.dart';
import 'package:medicine_manager/functions/notifications/schedule_notifications.dart';

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

Future<void> createAlarm(String medicineName, DateTime medicineTime) async {
  if (medicineTime.isAfter(DateTime.now())) {
    await Alarm.set(
        alarmSettings: alarmSettings.copyWith(
            dateTime: medicineTime,
            id: generateId(medicineName, medicineTime)));
  }
}
