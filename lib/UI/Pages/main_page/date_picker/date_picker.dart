import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_manager/UI/Provider/provider.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

class CustomDatePicker extends ConsumerWidget {
  const CustomDatePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WeeklyDatePicker(
      selectedDigitBackgroundColor: Theme.of(context).primaryColor,
      selectedColor: Theme.of(context).primaryColor,
      selectedDay: ref.watch(dateProvider), // ask about this later
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      enableWeeknumberText: false,
      digitsColor: Theme.of(context).textTheme.bodyLarge!.color!,
      weekdayTextColor: Theme.of(context).textTheme.bodyLarge!.color!,
      changeDay: (selectedDate) {
        ref.read(dateProvider.notifier).state = selectedDate;
      },
    );
  }
}
