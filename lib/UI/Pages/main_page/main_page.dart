import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:medicine_manager/UI/Pages/main_page/date_picker/date_picker.dart';
import 'package:medicine_manager/UI/Pages/main_page/medicine_list/medicine_list.dart';
import 'package:medicine_manager/UI/Provider/medicine_provider.dart';
import 'package:medicine_manager/UI/Theme/colors.dart';
import 'package:medicine_manager/functions/time/date_to_string.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    ref.watch(medicineProvider.notifier).updateList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Back"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.date_range)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "settings");
              },
              icon: Icon(Icons.settings))
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
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Material(
              elevation: 10,
              child: CustomDatePicker(),
            ),
          ),
          Gap(20),
          Expanded(
            flex: 13,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MedicineList(),
            ),
          ),
        ],
      ),
    );
  }
}
