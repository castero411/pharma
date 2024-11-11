import 'package:flutter/material.dart';
import 'package:medicine_manager/UI/Theme/colors.dart';

class DisplaySwitchTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSwitched;
  final ValueChanged<bool> onChanged;

  const DisplaySwitchTile({
    super.key,
    required this.icon,
    required this.title,
    required this.isSwitched,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: SwitchListTile(
        value: isSwitched,
        onChanged: onChanged,
        title: Text(
          title,
          style: TextStyle(color: xLightTextColor),
        ),
        secondary: Icon(
          icon,
          size: 30,
          color: xLightTextColor,
        ),
      ),
    );
  }
}
