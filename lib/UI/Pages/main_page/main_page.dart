import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_manager/UI/Pages/main_page/date_picker/date_picker.dart';
import 'package:medicine_manager/UI/Pages/main_page/medicine_list/medicine_list.dart';
import 'package:medicine_manager/UI/Provider/current_medicine_provider.dart';
import 'package:medicine_manager/UI/Provider/provider.dart';
import 'package:medicine_manager/UI/Theme/colors.dart';
import 'package:medicine_manager/models/medicine.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime currnetDate = ref.watch(dateProvider);
    List<Medicine> medicineList = ref.watch(currentMedicine);

    return Scaffold(
      appBar: AppBar(
        title: Text("November 2024"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.date_range)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "settings");
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Material(
                color: xScaffoldColorLight,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(child: CustomDatePicker()),
                )),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: MedicineList(
                currentMedicines: medicineList,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: xLightTextColor,
        onPressed: () {
          Navigator.pushNamed(context, 'add_medicine');
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
