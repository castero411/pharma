// notifications_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:medicine_manager/UI/Pages/add_medicine/drop_list/drop_list.dart';
import 'package:medicine_manager/UI/Pages/common/widgets/switch_tile.dart';
import 'package:medicine_manager/UI/Provider/theme_provider.dart';
import '../../Provider/provider.dart';

class DisplayPage extends ConsumerWidget {
  // Change to ConsumerWidget
  const DisplayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider state to get the current switch value
    // final isSwitched = ref.watch(displaySwitchProvider);
    final theme = ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Display",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(23),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Text(
                  "App Theme",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 20),
                  textAlign: TextAlign.left,
                ),
              ),
              DropdownButtonFormField<AppTheme>(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).iconTheme.color!,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).iconTheme.color!,
                      width: 2.0,
                    ),
                  ),
                ),
                focusColor: Theme.of(context).scaffoldBackgroundColor,
                dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(20),
                value: theme,
                onChanged: (newTheme) {
                  if (newTheme != null) {
                    ref.read(themeProvider.notifier).setTheme(newTheme);
                  }
                },
                items: AppTheme.values.map((AppTheme theme) {
                  return DropdownMenuItem(
                    value: theme,
                    child: Text(
                      theme
                          .toString()
                          .split('.')
                          .last, // Show only the theme name
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                  );
                }).toList(),
              ),

              // SwitchTile(
              //   icon: Ionicons.pencil_outline,
              //   title: "Dark Mode",
              //   isSwitched: isSwitched,
              //   onChanged: (bool value) {
              //     // Update the provider's state
              //     ref.read(displaySwitchProvider.notifier).state = value;
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
