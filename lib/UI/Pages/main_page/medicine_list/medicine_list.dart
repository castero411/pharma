import 'package:flutter/material.dart';
import 'package:medicine_manager/UI/Pages/main_page/medicine_tile_view/medicine_tile.dart';
import 'package:medicine_manager/models/medicine.dart';

class MedicineList extends StatelessWidget {
  const MedicineList({super.key, required this.currentMedicines});

  final List<Medicine> currentMedicines; // List of medicines for today

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: currentMedicines.length,
      itemBuilder: (context, item) {
        final medicine = currentMedicines[item];

        return MedicineTile(
          name: medicine.name,
          time: medicine.time.toString(), // Displaying the time of the medicine
          taken:
              false, // This can be updated based on whether the medicine has been taken
        );
      },
    );
  }
}
