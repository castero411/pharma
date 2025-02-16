import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:medicine_manager/UI/Provider/provider.dart';

class OptionsBar extends ConsumerWidget {
  const OptionsBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool hours = ref.watch(hoursMethodProvider);

    return Row(
      children: [
        Expanded(
          child: Button(
            text: "once per day",
            isPressed: !hours,
            onPress: () {
              ref.read(hoursMethodProvider.notifier).state = false;
            },
          ),
        ),
        Gap(20),
        Expanded(
          child: Button(
            text: "once per hour",
            isPressed: hours,
            onPress: () {
              ref.read(hoursMethodProvider.notifier).state = true;
            },
          ),
        ),
      ],
    );
  }
}

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.isPressed,
      required this.text,
      required this.onPress});
  final bool isPressed;
  final String text;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: isPressed
              ? Theme.of(context).primaryColor
              : Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(
            color: isPressed ? Colors.white : Theme.of(context).highlightColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Center(
          child: Text(
            text,
            style: isPressed
                ? Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.white,
                    )
                : Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
          ),
        ),
      ),
    );
  }
}
