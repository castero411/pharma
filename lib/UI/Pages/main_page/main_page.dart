import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_manager/UI/Pages/main_page/medicine_list/medicine_list.dart';
import 'package:medicine_manager/models/medicine.dart';
import 'package:medicine_manager/UI/Provider/current_medicine_provider.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  // Function to get the list of medicines for today
  Future<List<Medicine>> getMedicinesForToday(WidgetRef ref) async {
    final medicines = ref.watch(currentMedicine);
    final today = DateTime.now()
        .weekday; // Get the current weekday (1 = Monday, 7 = Sunday)

    // Filter medicines based on today's weekday
    return medicines.where((medicine) {
      return medicine.daysOfTheWeek.contains(_getDayString(today));
    }).toList();
  }

  // Helper function to map weekday number to string
  String _getDayString(int weekday) {
    switch (weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicines for Today'),
      ),
      body: FutureBuilder<List<Medicine>>(
        future: getMedicinesForToday(ref), // Fetch medicines for today
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No medicines for today'));
          }

          final medicines = snapshot.data!;

          return MedicineList(
              currentMedicines:
                  medicines); // Pass the medicines list to the list widget
        },
      ),
    );
  }
}
