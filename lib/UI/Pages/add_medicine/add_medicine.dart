import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:medicine_manager/UI/Pages/add_medicine/bottom_button/bottom_button.dart';
import 'package:medicine_manager/UI/Pages/add_medicine/description_field/description_field.dart';
import 'package:medicine_manager/UI/Pages/add_medicine/drop_list/drop_list.dart';
import 'package:medicine_manager/UI/Pages/add_medicine/name_text_field/name_text_field.dart';
import 'package:medicine_manager/UI/Pages/add_medicine/week_list/week_list.dart';
import 'package:medicine_manager/UI/Pages/common/widgets/time_picker.dart';
import 'package:medicine_manager/UI/Provider/add_medicine_providers.dart';
import 'package:medicine_manager/UI/Theme/Text_style.dart';
import 'package:medicine_manager/UI/Theme/colors.dart';
import 'package:medicine_manager/functions/validation/medicine_form_validator.dart';

class AddMedicine extends ConsumerWidget {
  AddMedicine({super.key});

  final double gapSize = 50;

  final DateTime startingDate = DateTime.now();
  final String currentType = 'pills';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController _doseController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  Future<void> _addMedicine() async {
    // TODO: add the medicine to the data sets
    if (_globalKey.currentState!.validate()) {
      print(descriptionController.text);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final daysOfTheWeek = ref.watch(selectedDaysProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Medicine",
          style: mediumTextStyle,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomButton(
        onTap: () {
          _addMedicine();
        },
        height: 64,
      ),
      body: SafeArea(
        child: Form(
          key: _globalKey,
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
                          keyboardType: TextInputType.text,
                          controller: nameController,
                          text: 'Name',
                          validator: nameValidator,
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
                  DropList(
                    currentValue: currentType,
                  ),
                  Gap(gapSize),
                  Text(
                    "Period",
                    style: labelTextStyle,
                  ),
                  Center(child: TimePicker()),
                  Gap(gapSize),
                  Text(
                    "Dose",
                    style: labelTextStyle,
                  ),
                  NameTextField(
                    // must only be a number
                    controller: _doseController,
                    text: "",
                    validator: hasNumber,
                    keyboardType: TextInputType.number,
                  ),
                  Gap(gapSize),
                  Text(
                    "Days",
                    style: labelTextStyle,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 14,
                    child: WeekList(
                      currentWeek: daysOfTheWeek,
                    ),
                  ),
                  Gap(gapSize),
                  Text(
                    "Description",
                    style: labelTextStyle,
                  ),
                  DescriptionField(
                    controller: descriptionController,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
