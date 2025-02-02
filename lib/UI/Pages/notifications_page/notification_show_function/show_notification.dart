import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> showPersistentNotification() async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    'foreground_service_channel_id',
    'Foreground Service',
    channelDescription: 'This is a non-dismissable notification.',
    importance: Importance.max,
    priority: Priority.high,
    ongoing: true,
    autoCancel: false,
  );

  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);

  //this is what will be displayed in the notification
  await flutterLocalNotificationsPlugin.show(
    0,
    //this will be the title of the notification itself
    'Good Man Alert!',
    //this is the part where the content will be included
    'There is a good man in the building!',
    notificationDetails,
  );
}
