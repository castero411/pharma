import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:medicine_manager/UI/Pages/add_medicine/drop_list/drop_list.dart';

import 'package:medicine_manager/UI/Pages/common/widgets/custom_form_field.dart';
import 'package:medicine_manager/UI/Pages/common/widgets/wide_button.dart';
import 'package:medicine_manager/UI/Provider/provider.dart';
import 'package:medicine_manager/UI/Provider/user_data_provider.dart';
import 'package:medicine_manager/firebase/update_username.dart';
import 'package:medicine_manager/functions/validation/medicine_form_validator.dart';

List<String> genders = ["male", "female"];

// ignore: must_be_immutable
class InfoPage extends ConsumerWidget {
  InfoPage({super.key});

  final _formKey = GlobalKey<FormState>();

  //parameters that will be needed to update the username
  final TextEditingController _newUsernameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  final userId = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account Edit",
          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 25.0, left: 23, right: 23),
        child: WideButton(
          title: 'Submit',
          onTap: () async {
            // Execute the edit account credentials process when the button is tapped
            if (_formKey.currentState?.validate() ?? false) {
              // Form is valid, perform edit account credentials
              editUserInfoNoName(
                userId.toString(),
                _ageController.text,
                ref.watch(genderProvider),
              );
              ref.watch(userInfoProvider.notifier).updateInfo();
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, 'main_page');
            }
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(23),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(20),
                CustomFormField(
                  hint: "Age",
                  obscure: false,
                  controller: _ageController,
                  validator: hasNumber,
                ),
                Gap(20),
                DropList(
                  currentProvider: genderProvider,
                  listItems: genders,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
