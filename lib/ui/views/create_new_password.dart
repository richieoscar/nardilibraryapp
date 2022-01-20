

import 'package:flutter/material.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/ui/views/finish_registration.dart';
import 'package:nardilibraryapp/viewmodels/createnew_password_viewmodel.dart';
import 'package:nardilibraryapp/widgets/password_text_field.dart';
import 'package:nardilibraryapp/widgets/progressar.dart';
import 'package:provider/provider.dart';

import 'package:nardilibraryapp/widgets/custom_app_bar.dart';
import 'package:nardilibraryapp/widgets/custom_button.dart';
import 'package:nardilibraryapp/widgets/custome_text_form_field.dart';

class CreateNewPassword extends StatefulWidget {
  static const routeName = "/createNewpassword";
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreateNewPassword> {
  final TextEditingController _oldPasswordcontroller = TextEditingController();
  final TextEditingController _newPasswordcontroller = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBAr(
        title: "Create New Password",
        icon: Icon(Icons.ac_unit),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 15),
                PasswordTextFormField(
                    headerTitle: "Old Password",
                    hintText: "password",
                    controller: _oldPasswordcontroller),
                const SizedBox(height: 10),
                PasswordTextFormField(
                    headerTitle: "New Password",
                    hintText: "Password",
                    controller: _newPasswordcontroller),
                const SizedBox(height: 10),
                PasswordTextFormField(
                    headerTitle: "Confirm New Password",
                    hintText: "Password",
                    controller: _confirmNewPasswordController),
                const SizedBox(height: 40),
                CustomButton(
                  label: "RESET PASSWORD",
                  onclick: () => _resetPassword(context),
                ),
                const SizedBox(
                  height: 20,
                ),
                ProgressBar(
                    context.watch<CreateNewPasswordViewmodel>().isVisible),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _newPasswordcontroller.dispose();
    _oldPasswordcontroller.dispose();
    _confirmNewPasswordController.dispose();
  }

  void _resetPassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<CreateNewPasswordViewmodel>().isVisible = true;
      context.read<CreateNewPasswordViewmodel>().createNewPassword(
          _oldPasswordcontroller.text.trim(),
          _newPasswordcontroller.text.trim(),
          _confirmNewPasswordController.text.trim(),
          context);
    }
  }
}
