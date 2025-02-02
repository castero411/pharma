import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_manager/firebase/get_medicines.dart';
import 'package:medicine_manager/models/medicine.dart';
import '../Pages/notifications_page/notification_show_function/show_notification.dart'; // Import NotificationService singleton

class CurrentMedicineNotifier extends StateNotifier<List<Medicine>> {
  CurrentMedicineNotifier() : super([]);

  void updateList() async {
    state = await getMedicines();
    _notifyIfMedicineDue(); // Check if any medicine is due after updating the list
  }

  List<Medicine> getMedicinesOfTheDay(String date) {
    return state
        .where((medicine) => medicine.takenDate.containsKey(date))
        .toList();
  }

  // Function to check if any medicine is due and trigger a notification
  void _notifyIfMedicineDue() {
    DateTime now = DateTime.now();
    String todayStr =
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

    for (var medicine in state) {
      if (medicine.takenDate.containsKey(todayStr) &&
          !medicine.takenDate[todayStr]!) {
        NotificationService()
            .showPersistentNotification(); // Accessing the singleton instance
      }
    }
  }
}

final medicineProvider =
    StateNotifierProvider<CurrentMedicineNotifier, List<Medicine>>(
  (ref) => CurrentMedicineNotifier(),
);
