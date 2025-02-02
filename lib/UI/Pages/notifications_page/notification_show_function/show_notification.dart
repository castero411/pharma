import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Singleton instance
  static final NotificationService _instance = NotificationService._internal();

  // Factory constructor returning the singleton instance
  factory NotificationService() {
    return _instance;
  }

  // Private named constructor for the singleton pattern
  NotificationService._internal();

  // Method to show a persistent notification
  Future<void> showPersistentNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'foreground_service_channel_id',
      'Foreground Service',
      channelDescription: 'This is the MedGuard notification channel',
      importance: Importance.max,
      priority: Priority.high,
      ongoing: true,
      autoCancel: false,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    // Display the notification
    await flutterLocalNotificationsPlugin.show(
      0,
      'MedGuard Alert',
      'Time for your medicine!',
      notificationDetails,
    );
  }
}
