import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:medicine_manager/UI/Pages/add_medicine/bottom_button/bottom_button.dart';
import 'package:medicine_manager/UI/Pages/add_medicine/description_field/description_field.dart';
import 'package:medicine_manager/UI/Pages/add_medicine/drop_list/drop_list.dart';
import 'package:medicine_manager/UI/Pages/add_medicine/name_text_field/name_text_field.dart';
import 'package:medicine_manager/UI/Pages/add_medicine/options_bar/options_bar.dart';
import 'package:medicine_manager/UI/Pages/common/widgets/time_picker.dart';
import 'package:medicine_manager/UI/Provider/medicine_provider.dart';
import 'package:medicine_manager/UI/Provider/provider.dart';
import 'package:medicine_manager/UI/Theme/Text_style.dart';
import 'package:medicine_manager/firebase/add_or_update_medicine.dart';
import 'package:medicine_manager/functions/medicines/create_new_medicine.dart';
import 'package:medicine_manager/functions/time/new_date_with_hours.dart';
import 'package:medicine_manager/functions/validation/medicine_form_validator.dart';
import 'package:medicine_manager/models/drug_type.dart';

// import 'package:medicine_manager/UI/Provider/add_medicine_providers.dart';
// import 'package:medicine_manager/UI/Pages/add_medicine/week_list/week_list.dart';

class AddMedicine extends ConsumerWidget {
  AddMedicine({super.key});

  final double gapSize = 30;

  final DateTime startingDate = DateTime.now();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController _doseCountController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _doseController = TextEditingController();
  final TextEditingController _hoursCountController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool useHours = ref.watch(hoursMethodProvider);

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).primaryColor,
        title: Text(
          "Add Medicine",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomButton(
        onTap: () async {
          DateTime currnetDate = DateTime.now();
          TimeOfDay timeOfDay = ref.watch(timeProvider);

          if (_globalKey.currentState!.validate()) {
            if (useHours) {
              await addOrUpdateMedicine(createMedicineWithTakenHours(
                  doseNumber: _doseCountController.text,
                  description: descriptionController.text,
                  name: nameController.text,
                  dose: _doseController.text,
                  startingDate:
                      editDate(currnetDate, timeOfDay.hour, timeOfDay.minute),
                  type: ref.watch(medicineTypeProvider),
                  hours: _hoursCountController.text));
              ref.watch(medicineProvider.notifier).updateList();
              Navigator.pop(context);
            } else {
              await addOrUpdateMedicine(createMedicineWithTakenDates(
                doseNumber: _doseCountController.text,
                description: descriptionController.text,
                name: nameController.text,
                dose: _doseController.text,
                startingDate:
                    editDate(currnetDate, timeOfDay.hour, timeOfDay.minute),
                type: ref.watch(medicineTypeProvider),
              ));
              ref.watch(medicineProvider.notifier).updateList();
              //checkForScheduleNotifications(ref.read(medicineProvider));

              Navigator.pop(context);
            }
          }
        },
        height: 64,
      ),
      body: SafeArea(
        child: Form(
          key: _globalKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(20),
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
                            color: Theme.of(context).iconTheme.color,
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
                    style: labelTextStyle.copyWith(
                        color: Theme.of(context).iconTheme.color),
                  ),
                  DropList(
                    currentProvider: medicineTypeProvider,
                    listItems: drugType,
                  ),
                  Gap(gapSize),
                  Text(
                    "Time",
                    style: labelTextStyle.copyWith(
                        color: Theme.of(context).iconTheme.color),
                  ),
                  Center(child: TimePicker()),
                  Gap(gapSize),
                  Text(
                    "Dose",
                    style: labelTextStyle.copyWith(
                        color: Theme.of(context).iconTheme.color),
                  ),
                  NameTextField(
                    // must only be a number
                    controller: _doseController,
                    text: "",
                    validator: nameValidator,
                    keyboardType: TextInputType.text,
                  ),
                  Gap(20),

                  OptionsBar(),
                  Gap(20),

                  Visibility(
                    visible: !useHours,
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Number of days",
                            style: labelTextStyle.copyWith(
                                color: Theme.of(context).iconTheme.color),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "The number of days the medicine will be taken",
                          ),
                        ),
                        NameTextField(
                          // must only be a number
                          controller: _doseCountController,
                          text: "",
                          validator: hasNumber,
                          keyboardType: TextInputType.number,
                        ),
                        Gap(gapSize),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: useHours,
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Number of doses",
                            style: labelTextStyle.copyWith(
                                color: Theme.of(context).iconTheme.color),
                          ),
                        ),
                        SizedBox(
                          // number of dose description
                          width: double.infinity,
                          child: Text(
                            "The number of doses to be taken in the future",
                          ),
                        ),
                        NameTextField(
                          // must only be a number
                          controller: _doseCountController,
                          text: "",
                          validator: hasNumber,
                          keyboardType: TextInputType.number,
                        ),
                        Gap(gapSize),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Interval",
                            style: labelTextStyle.copyWith(
                                color: Theme.of(context).iconTheme.color),
                          ),
                        ),
                        SizedBox(
                          // intervals description
                          width: double.infinity,
                          child: Text(
                            "Number of hours interval between each medicine",
                          ),
                        ),
                        NameTextField(
                          // must only be a number
                          controller: _hoursCountController,
                          text: "",
                          validator: hasDecimalNumber,
                          keyboardType: TextInputType.number,
                        ),
                        Gap(gapSize),
                      ],
                    ),
                  ),

                  // Gap(gapSize),
                  // Text(
                  //   "Days",
                  //   style: labelTextStyle,
                  // ),
                  // SizedBox(
                  //   height: MediaQuery.sizeOf(context).height / 14,
                  //   child: WeekList(
                  //     currentWeek: daysOfTheWeek,
                  //   ),
                  // ),
                  Text(
                    "Description",
                    style: labelTextStyle.copyWith(
                        color: Theme.of(context).iconTheme.color),
                  ),
                  DescriptionField(
                    controller: descriptionController,
                  ),
                  Gap(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
