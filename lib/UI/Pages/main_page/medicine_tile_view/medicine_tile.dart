import 'package:flutter/material.dart';
import 'package:medicine_manager/UI/Theme/Text_style.dart';
import 'package:medicine_manager/UI/Theme/colors.dart';

class MedicineTile extends StatelessWidget {
  const MedicineTile(
      {super.key,
      this.time = '10:40',
      this.name = 'placeholder',
      this.taken = false});
  final String time;
  final String name;
  final bool taken;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Material(
        color: xContainerColor,
        borderRadius: BorderRadius.circular(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Material(
                  borderRadius: BorderRadius.circular(7),
                  color: xMainColor,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: Text(
                        time,
                        style: whiteTextStyle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      name,
                      style: mediumTextStyle.copyWith(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  taken ? Icons.close_rounded : Icons.check,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
