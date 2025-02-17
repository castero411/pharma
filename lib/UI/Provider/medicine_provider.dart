import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_manager/firebase/get_medicines.dart';
import 'package:medicine_manager/models/medicine.dart';

class CurrentMedicineNotifier extends StateNotifier<List<Medicine>> {
  CurrentMedicineNotifier() : super([]);

  void updateList() async {
    state = await getMedicines();
    //_notifyIfMedicineDue(); // Check if any medicine is due after updating the list
  }

  List<Medicine> getMedicinesOfTheDay(String date) {
    return state
        .where((medicine) => medicine.takenDate.containsKey(date))
        .toList();
  }

  //Function to check if any medicine is due and trigger a notification
}

final medicineProvider =
    StateNotifierProvider<CurrentMedicineNotifier, List<Medicine>>(
  (ref) => CurrentMedicineNotifier(),
);
