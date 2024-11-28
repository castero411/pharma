import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medicine_manager/UI/Pages/add_medicine/name_text_field/name_text_field.dart';
import 'package:medicine_manager/UI/Pages/common/widgets/time_picker.dart';
import 'package:medicine_manager/UI/Theme/Text_style.dart';
import 'package:medicine_manager/UI/Theme/colors.dart';
import 'package:medicine_manager/models/drug_type.dart';

enum DrugType {
  pills,
  injection,
  elixir,
  syrup,
  nepolyzer,
}

class AddMedicine extends StatelessWidget {
  AddMedicine({super.key});

  final double gapSize = 50;
  String? name;
  String? description;
  DateTime? startingDate;
  DateTime? endingDate;
  DrugType? currentType = DrugType.pills;

  TextEditingController nameController = TextEditingController();

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
        body: SafeArea(
            child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: SizedBox(
                          //placeholder for the image uploader
                          width: 70,
                          height: 70,
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: xLightTextColor,
                          ),
                        ),
                      ),
                      Gap(20),
                      Expanded(
                        flex: 3,
                        child: NameTextField(
                          controller: nameController,
                        ),
                      ),
                    ],
                  ),
                  Gap(gapSize),
                  Text(
                    "Type",
                    textAlign: TextAlign.left,
                    style: labelTextStyle,
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: xLightTextColor, // Your custom border color
                          width: 2.0, // Border width
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              xLightTextColor, // Your custom border color for focus
                          width: 2.0, // Border width for focus
                        ),
                      ),
                    ),
                    focusColor: xScaffoldColorLight,
                    dropdownColor: xScaffoldColorLight,
                    borderRadius: BorderRadius.circular(20),
                    value: currentType,
                    onChanged: (value) {
                      currentType = value;
                    },
                    items: [
                      for (final drugs in DrugType.values)
                        DropdownMenuItem(
                          value: drugs,
                          child: Text(
                            drugs.toString().split('.').last,
                            style: smallTextStyle,
                          ),
                        )
                    ],
                  ),
                  Gap(gapSize),
                  Text(
                    "Period",
                    style: labelTextStyle,
                  ),
                  Center(child: TimePicker()),
                  Gap(gapSize),
                  Text(
                    "Description",
                    style: labelTextStyle,
                  ),
                  TextFormField(
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
                  )
                ],
              ),
            ),
          ),
        )));
  }
}
