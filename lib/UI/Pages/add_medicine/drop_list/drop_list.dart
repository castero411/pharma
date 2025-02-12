import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_manager/UI/Theme/Text_style.dart';

// ignore: must_be_immutable
class DropList extends ConsumerWidget {
  const DropList(
      {super.key, required this.currentProvider, required this.listItems});
  final List<String> listItems;
  final StateProvider currentProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color:
                Theme.of(context).iconTheme.color!, // Your custom border color
            width: 2.0, // Border width
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context)
                .iconTheme
                .color!, // Your custom border color for focus
            width: 2.0, // Border width for focus
          ),
        ),
      ),
      focusColor: Theme.of(context).scaffoldBackgroundColor,
      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(20),
      value: ref.watch(currentProvider),
      onChanged: (value) {
        ref.read(currentProvider.notifier).state = value;
        //wi = value.toString();
      },
      items: [
        for (final drugs in listItems)
          DropdownMenuItem(
            value: drugs,
            child: Text(
              drugs.split('.').last,
              style: smallTextStyle.copyWith(
                  color: Theme.of(context).iconTheme.color),
            ),
          )
      ],
    );
  }
}
