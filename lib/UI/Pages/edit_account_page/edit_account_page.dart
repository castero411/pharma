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
class EditAccountPage extends ConsumerWidget {
  EditAccountPage({super.key});

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
            color: Theme.of(context).textTheme.bodyLarge!.color!,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 100.0, right: 100.0, bottom: 25.0),
        child: WideButton(
          title: 'Submit',
          onTap: () async {
            // Execute the edit account credentials process when the button is tapped
            if (_formKey.currentState?.validate() ?? false) {
              // Form is valid, perform edit account credentials
              final newUsername = _newUsernameController.text;
              editUserInfo(
                userId.toString(),
                newUsername,
                _ageController.text,
                ref.watch(genderProvider),
              );
              await ref.watch(userInfoProvider.notifier).updateInfo();
              Navigator.pop(context);
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
                // Logo (you can replace this with an actual logo)

                Padding(
                  padding: const EdgeInsets.only(top: 25.0, bottom: 50.0),
                  child: Icon(
                    Icons.build_rounded,
                    size: 130,
                  ),
                ),

                CustomFormField(
                  hint: "New Username",
                  obscure: false,
                  controller: _newUsernameController,
                ),
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
