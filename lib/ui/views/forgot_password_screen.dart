import 'package:flutter/material.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/ui/views/verify_email_screen.dart';
import 'package:nardilibraryapp/viewmodels/forgot_password_viewmodel.dart';

import 'package:nardilibraryapp/widgets/custom_app_bar.dart';
import 'package:nardilibraryapp/widgets/custom_button.dart';
import 'package:nardilibraryapp/widgets/custome_text_form_field.dart';
import 'package:nardilibraryapp/widgets/progressar.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  static const String routeName = "/forgortPassword";
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBAr(
            title: "Forgot Password", icon: Icon(Icons.arrow_back_ios_new)),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 28,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Enter your registered email below to recieve password reset instructions",
                    style: AppStyle.mediumText,
                  ),
                ),
                const SizedBox(
                  height: 34,
                ),
                CustomTextFormField(
                    headerTitle: "Username",
                    hintText: "Username",
                    controller: _controller),
                const SizedBox(
                  height: 38,
                ),
                CustomButton(
                  label: "SUBMIT",
                  onclick: () => _submit(context),
                ),
                const SizedBox(
                  height: 50,
                ),
                ProgressBar(context.watch<ForgotPasswordViewmodel>().isVisible),
              ],
            ),
          ),
        ));
  }

  void _submit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      context.read<ForgotPasswordViewmodel>().isVisible = true;
      print(_controller.text);
      context
          .read<ForgotPasswordViewmodel>()
          .forgotPassword(_controller.text, context);
    }
  }
}
