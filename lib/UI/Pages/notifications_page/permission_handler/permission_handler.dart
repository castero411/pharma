import 'package:medicine_manager/UI/Pages/notifications_page/notification_show_function/show_notification.dart';
import 'package:permission_handler/permission_handler.dart';

//import '../notification_show_function/show_notification.dart';

//this function will check if the system itself did allow notifications or not
Future<bool> requestNotificationPermission() async {
  //the status will be the variable responsible for requesting access to push notifications
  var status = await Permission.notification.request();

  final NotificationService notificationService = NotificationService();

//this condition will check if the access is granted or not
  if (status.isGranted) {
    // showPersistentNotification();
    //notificationService.showPersistentNotification(
    //   title: 'acess granted', body: '');
  } else if (status.isPermanentlyDenied) {
    // if the user permanently denies permission, guide them to the app settings
    openAppSettings();
  }

  return false;
}
