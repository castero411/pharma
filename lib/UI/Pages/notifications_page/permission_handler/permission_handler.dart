import 'package:permission_handler/permission_handler.dart';

import '../notification_show_function/show_notification.dart';

//this function will check if the system itself did allow notifications or not
Future<void> requestNotificationPermission() async {
  //the status will be the variable responsible for requesting access to push notifications
  var status = await Permission.notification.request();

//this condition will check if the access is granted or not
  if (status.isGranted) {
    //once the access is granted a function displaying the notification itself will be called
    showPersistentNotification();
  }
}
