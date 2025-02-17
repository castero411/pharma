import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_manager/UI/Pages/notifications_page/notification_show_function/show_notification.dart';
import 'package:medicine_manager/UI/Provider/medicine_provider.dart';
import 'package:medicine_manager/functions/notifications/schedule_notifications.dart';
import 'package:medicine_manager/models/medicine.dart';
import 'package:permission_handler/permission_handler.dart';

//import '../notification_show_function/show_notification.dart';

//this function will check if the system itself did allow notifications or not
Future<bool> requestNotificationPermission(WidgetRef ref) async {
  try {
    // Log permission request start
    print("Requesting notification permission...");

    // Request permission
    var status = await Permission.notification.request();
    print("Notification Permission status: $status");

    // If permission is granted
    if (status.isGranted) {
      print("Permission granted!");

      try {
        final List<Medicine> medicineList =
            ref.read(medicineProvider); // Get medicine list
        print("Medicine list retrieved: $medicineList");

        final NotificationService notificationService = NotificationService();
        print("NotificationService created");

        // Call to check for scheduled notifications
        checkForScheduleNotifications(medicineList);
        print("Checked for scheduled notifications");

        return true;
      } catch (e) {
        print("Error inside permission granted block: $e");
        return false;
      }
    } else if (status.isPermanentlyDenied) {
      print("Permission permanently denied, opening app settings...");
      openAppSettings();
      return false;
    }

    return false;
  } catch (e) {
    print("Error during permission request inside the function: $e");
    return false;
  }
}
