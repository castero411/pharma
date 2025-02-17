// notifications_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:medicine_manager/UI/Pages/common/widgets/switch_tile.dart';
import 'package:medicine_manager/UI/Pages/notifications_page/permission_handler/permission_handler.dart';
import 'package:medicine_manager/UI/Provider/medicine_provider.dart';
import '../../../functions/notifications/schedule_notifications.dart';
import '../../Provider/provider.dart';

class NotificationsPage extends ConsumerWidget {
  // Change to ConsumerWidget
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider state to get the current switch value
    final isSwitched = ref.watch(switchProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SwitchTile(
              icon: Ionicons.notifications_outline,
              title: "Allow Notifications",
              isSwitched: isSwitched,
              onChanged: (bool value) async {
                // Update the provider's state
                try {
                  ref.read(switchProvider.notifier).state = value;

                  if (value) {
                    await requestNotificationPermission(ref);
                  }
                } catch (e) {
                  print("Error during permission request!");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
