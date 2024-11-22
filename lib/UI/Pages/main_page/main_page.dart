import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:medicine_manager/UI/Pages/main_page/date_picker/date_picker.dart';
import 'package:medicine_manager/UI/Pages/main_page/medicine_tile_view/medicine_tile.dart';
import 'package:medicine_manager/UI/Theme/colors.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  late DateTime currentTime;

  @override
  Widget build(BuildContext context) {
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
              child: Column(
                children: [
                  MedicineTile(),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: xLightTextColor,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
