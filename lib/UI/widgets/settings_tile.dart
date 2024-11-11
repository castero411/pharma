import 'package:flutter/material.dart';
import 'package:medicine_manager/UI/Theme/colors.dart';

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onTap;
  const SettingsTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 25),
            child: Icon(
              icon,
              size: 30,
              color: xLightTextColor,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: xLightTextColor),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 24,
            color: xLightTextColor,
          ),
        ],
      ),
    );
  }
}
