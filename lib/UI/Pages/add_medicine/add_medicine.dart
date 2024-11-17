import 'package:flutter/material.dart';
import 'package:medicine_manager/UI/Pages/add_medicine/image_picker.dart';
import 'package:medicine_manager/UI/Theme/Text_style.dart';
import 'package:medicine_manager/UI/Theme/colors.dart';

class AddMedicine extends StatelessWidget {
  const AddMedicine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Medicine",
          style: mediumTextStyle,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: xLightTextColor,
            size: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                bottom: 6,
              ),

              //This is where the the name and the upload image will be added!
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      onPressed: () async {
                        await pickImage();
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(61, 61),
                        backgroundColor: xHintColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Icon(
                        Icons.file_upload_outlined,
                        size: 22,
                        color: xLightTextColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      width: 261,
                      child: TextFormField(
                        autocorrect: false,
                        cursorColor: xLightTextColor,
                        decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: labelTextStyle,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: xLightTextColor,
                              width: 2,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: xLightTextColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              //TODO: create the type dropdown list widget
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              //TODO: create The Time Picker widget
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              //TODO: create a widget for the period
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                "Description",
                style: textFieldTitle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: TextField(
                minLines: 5,
                maxLines: 5,
                style: textFieldEntry,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: xLightButtonColor,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: xLightButtonColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: xLightButtonColor,
                    ),
                  ),
                ),
                cursorColor: xLightTextColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
