import 'package:drop_down_list/drop_down_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_manager/UI/Pages/main_page/medicine_tile_view/medicine_tile.dart';
import 'package:medicine_manager/UI/Provider/medicine_provider.dart';
import 'package:medicine_manager/UI/Provider/provider.dart';
import 'package:medicine_manager/firebase/update_medicine.dart';
import 'package:medicine_manager/functions/time/date_to_string.dart';
import 'package:medicine_manager/models/medicine.dart';

class MedicineList extends ConsumerWidget {
  const MedicineList({
    super.key,
    required this.onHold,
    required this.takeMedicine,
  });
  final Function(Medicine) takeMedicine;
  final Function(Medicine) onHold;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime currentDate = ref.watch(dateProvider);
    String formatedDate = formatDate(currentDate);

    List<Medicine> currentMedicines =
        ref.watch(medicineProvider.notifier).getMedicinesOfTheDay(formatedDate);

    List<MedicineTime> loopedMeds = [];

    for (var meds in currentMedicines) {
      if (meds.takenDate[formatedDate] == null) {
        break;
      }

      for (var entries in meds.takenDate[formatedDate]!.entries) {
        loopedMeds.add(MedicineTime(medicine: meds, time: entries.key));
      }
    }

    return ListView.builder(
      itemCount: loopedMeds.length,
      itemBuilder: (context, item) {
        String time = loopedMeds[item].time;

        return MedicineTile(
          onTapIcon: () async {
            takeMedicine(loopedMeds[item].medicine);
            await updateMedicineState(
                currentMedicines[item].name, formatedDate, time);
            ref.read(medicineProvider);
          },
          onTapBody: () {
            onHold(loopedMeds[item].medicine);
          },
          time: time,
          name: loopedMeds[item].medicine.name,
          taken: loopedMeds[item].medicine.takenDate[formatedDate]![time]!,
          // This can be updated based on whether the medicine has been taken
        );
      },
    );
  }
}

class MedicineTime {
  final Medicine medicine;
  final String time;

  const MedicineTime({required this.medicine, required this.time});
}
