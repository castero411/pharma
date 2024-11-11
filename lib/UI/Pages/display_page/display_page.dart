// notifications_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:medicine_manager/UI/Theme/Text_style.dart';
import 'package:medicine_manager/UI/widgets/display_switch_tile.dart';
import '../../Provider/provider.dart';
import '../../Theme/colors.dart';

class DisplayPage extends ConsumerWidget {
  // Change to ConsumerWidget
  const DisplayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider state to get the current switch value
    final isSwitched = ref.watch(displaySwitchProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Display",
          style: mediumTextStyle,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: xLightTextColor,
            size: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            DisplaySwitchTile(
              icon: Ionicons.pencil_outline,
              title: "Light Mode",
              isSwitched: isSwitched,
              onChanged: (bool value) {
                // Update the provider's state
                ref.read(displaySwitchProvider.notifier).state = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
