import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_manager/UI/Pages/common/widgets/image_picker.dart';
import 'package:medicine_manager/UI/Pages/common/widgets/app_text_field.dart';
import 'package:medicine_manager/UI/Pages/common/widgets/day_text_field.dart';
import 'package:medicine_manager/UI/Pages/common/widgets/time_picker.dart';
import 'package:medicine_manager/UI/Provider/provider.dart';
import 'package:medicine_manager/UI/Theme/Text_style.dart';
import 'package:medicine_manager/UI/Theme/colors.dart';

class AddMedicine extends StatelessWidget {
  const AddMedicine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Medicine",
          style: mediumTextStyle,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: xLightTextColor,
            size: 30,
          ),
        ),
      ),
      body: Builder(builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    bottom: 6,
                  ),

                  //This is where the the name and the upload image will be added!
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                          onPressed: () async {
                            await pickImage();
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(61, 61),
                            backgroundColor: xHintColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Icon(
                            Icons.file_upload_outlined,
                            size: 22,
                            color: xLightTextColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SizedBox(
                          width: 261,
                          child: TextFormField(
                            autocorrect: false,
                            cursorColor: xLightTextColor,
                            decoration: InputDecoration(
                              labelText: "Name",
                              labelStyle: labelTextStyle,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: xLightTextColor,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: xLightTextColor,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //this is where the medicine type will be added
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 6),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      "Type",
                      style: textFieldTitle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 6),
                  child: Consumer(
                    builder: (context, ref, _) {
                      final selectedMeds = ref.watch(selectedMedicinesProvider);
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: AppTextField(
                          textEditingController: TextEditingController(),
                          title: "",
                          hint: "Select Your Medicine",
                          isMedicineSelected: true,
                          medType: [
                            SelectedListItem(name: "Pills"),
                            SelectedListItem(name: "Injection"),
                            SelectedListItem(name: "Elixir"),
                            SelectedListItem(name: "Syrup"),
                          ],
                          ref: ref,
                        ),
                      );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 6, left: 25),
                  child: Text(
                    "Time",
                    style: textFieldTitle,
                  ),
                ),

                //TODO: create The Time Picker widget
                Center(child: TimePicker()),
                //This is where the time picker widget will be added

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                ),

                //This is where the period widget will be added
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 6, left: 25),
                  child: Text(
                    "period",
                    style: textFieldTitle,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Consumer(
                    builder: (context, ref, _) {
                      final selectedPeriods =
                          ref.watch(selectedPeriodsProvider);
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: DayTextField(
                          textEditingController: TextEditingController(),
                          title: "",
                          hint: "How many days",
                          isMedicineSelected: true,
                          day: [
                            SelectedListItem(name: "Every Day"),
                            SelectedListItem(name: "Once a week"),
                            SelectedListItem(name: "Twice a week"),
                            SelectedListItem(name: "Three times a week"),
                            SelectedListItem(name: "Four times a week"),
                            SelectedListItem(name: "Five times a week"),
                            SelectedListItem(name: "Six times a week"),
                          ],
                          ref: ref,
                        ),
                      );
                    },
                  ),
                ),

                //This is the part where the description is added
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    "Description",
                    style: textFieldTitle,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 6),
                  child: TextField(
                    minLines: 5,
                    maxLines: 5,
                    style: textFieldEntry,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0)),
                      filled: true,
                      fillColor: xLightButtonColor,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: BorderSide(color: xLightButtonColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: BorderSide(
                          color: xLightButtonColor,
                        ),
                      ),
                    ),
                    cursorColor: xLightTextColor,
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
