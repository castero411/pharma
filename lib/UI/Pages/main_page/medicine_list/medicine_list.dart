import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:medicine_manager/UI/Pages/main_page/medicine_tile_view/medicine_tile.dart';
import 'package:medicine_manager/UI/Provider/medicine_provider.dart';
import 'package:medicine_manager/UI/Provider/provider.dart';
import 'package:medicine_manager/firebase/update_medicine.dart';
import 'package:medicine_manager/functions/alarm/create_alarm.dart';
import 'package:medicine_manager/functions/notifications/schedule_notifications.dart';
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
        loopedMeds.add(MedicineTime(
            medicine: meds, time: entries.key, isTaken: entries.value));
      }
    }

    sortByTime(loopedMeds);

    return ListView.builder(
      itemCount: loopedMeds.length,
      itemBuilder: (context, item) {
        String time = loopedMeds[item].time;
        String name = loopedMeds[item].medicine.name;
        return Padding(
          padding: (loopedMeds.length - 1 == item)
              ? const EdgeInsets.only(bottom: 60)
              : const EdgeInsets.only(bottom: 0),
          child: MedicineTile(
            onTapIcon: () async {
              takeMedicine(loopedMeds[item].medicine);
              if (loopedMeds[item].isTaken) {
                // untake medicine or reEnable alarm
                await updateMedicineStateToFalse(name, formatedDate, time);
                reEnableAlarm(name, formatedDate, time);
              } else {
                // take medicine and disable it's alarm
                await updateMedicineState(name, formatedDate, time);
                Alarm.stop(generateId(name, formatedDate, time));
              }
              ref.read(medicineProvider);
            },
            onTapBody: () {
              onHold(loopedMeds[item].medicine);
            },
            time: time,
            name: loopedMeds[item].medicine.name,
            taken: loopedMeds[item].medicine.takenDate[formatedDate]![time]!,
            // This can be updated based on whether the medicine has been taken
          ),
        );
      },
    );
  }
}

class MedicineTime {
  final Medicine medicine;
  final String time;
  final bool isTaken;

  const MedicineTime(
      {required this.medicine, required this.time, required this.isTaken});
}

void sortByTime(List<MedicineTime> loopedMeds) {
  final DateFormat format = DateFormat("hh:mm a");

  loopedMeds.sort((a, b) {
    DateTime timeA = format.parse(a.time);
    DateTime timeB = format.parse(b.time);
    return timeA.compareTo(timeB);
  });
}
