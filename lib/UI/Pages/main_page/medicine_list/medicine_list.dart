import 'package:flutter/material.dart';
import 'package:medicine_manager/UI/Pages/main_page/medicine_tile_view/medicine_tile.dart';
import 'package:medicine_manager/models/med_time.dart';

class MedicineList extends StatelessWidget {
  const MedicineList({super.key, required this.currentMedicines});
  final List<MedicineTime> currentMedicines;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: currentMedicines.length,
      itemBuilder: (context, item) {
        return MedicineTile(
          name: currentMedicines[item].name,
          time: currentMedicines[item].time,
          taken: currentMedicines[item].taken,
        );
      },
    );
  }
}
