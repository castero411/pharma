import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_manager/models/medicine.dart';

class CurrentMedicineNotifier extends StateNotifier<List<Medicine>> {
  CurrentMedicineNotifier() : super([]);

  // Add a new medicine
  void addMedicine(Medicine medicine) {
    state = [...state, medicine];
  }

  // Update an existing medicine by its name (or any unique field)
  void updateMedicine(String name, Medicine updatedMedicine) {
    final index = state.indexWhere((medicine) => medicine.name == name);
    if (index != -1) {
      final updatedList = [...state];
      updatedList[index] = updatedMedicine;
      state = updatedList;
    }
  }

  // Delete a medicine by its name (or any unique field)
  void deleteMedicine(String name) {
    state = state.where((medicine) => medicine.name != name).toList();
  }

  // Get medicines for a specific day
  List<Medicine> getMedicinesForDay(String day) {
    return state
        .where((medicine) => medicine.daysOfTheWeek.contains(day))
        .toList();
  }

  // Get the list of all medicines
  List<Medicine> getCurrentMedicines() {
    return state;
  }

  // Get a specific medicine by name (or any unique field)
  Medicine? getMedicineByName(String name) {
    return state.firstWhere(
      (medicine) => medicine.name == name,
    );
  }
}

final currentMedicine =
    StateNotifierProvider<CurrentMedicineNotifier, List<Medicine>>((ref) {
  return CurrentMedicineNotifier();
});
