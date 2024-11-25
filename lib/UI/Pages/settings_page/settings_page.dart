import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:medicine_manager/UI/Theme/Text_style.dart';
import 'package:medicine_manager/UI/Theme/colors.dart';
import 'package:medicine_manager/UI/Pages/common/widgets/settings_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //this is the app bar of the page where the title and the icon button to leave the settings page will be added
      appBar: AppBar(
        title: Text(
          "Settings",
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
            )),
      ),

      //this is the body of the scaffold where the content of the page will be added
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
              child: SettingsTile(
                icon: Ionicons.person_circle_outline,
                title: "Account",
                onTap: () {
                  //TODO: create an account page
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SettingsTile(
                icon: Ionicons.notifications_outline,
                title: "Notifications",
                onTap: () {
                  Navigator.pushNamed(context, 'notifications');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SettingsTile(
                icon: Ionicons.pencil_sharp,
                title: "Display",
                onTap: () {
                  Navigator.pushNamed(context, 'display');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SettingsTile(
                icon: Ionicons.log_out_outline,
                title: "Log out",
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
