import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_manager/UI/Theme/Text_style.dart';
import 'package:medicine_manager/UI/vague_widgets/decorated_box.dart';
import '../../../Provider/provider.dart';

class TimePicker extends ConsumerWidget {
  const TimePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTime = ref.watch(timeProvider);

    return SizedBox(
      width: double.infinity,
      child: InputBoxDecor(
        child: InkWell(
          onTap: () async {
            final newTime = await showTimePicker(
              context: context,
              initialTime: selectedTime,
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    timePickerTheme: TimePickerThemeData(
                      helpTextStyle: veryBigTextStyle.copyWith(
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                  ),
                  child: child!,
                );
              },
            );

            if (newTime != null) {
              ref.read(timeProvider.notifier).state = newTime;
            }
          },
          child: Center(
            child: Text(
              selectedTime.format(context),
              style: veryBigTextStyle.copyWith(
                  color: Theme.of(context).iconTheme.color),
            ),
          ),
        ),
      ),
    );
  }
}
