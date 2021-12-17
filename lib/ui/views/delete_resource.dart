import 'package:flutter/material.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/ui/views/verify_email_screen.dart';
import 'package:nardilibraryapp/viewmodels/delete_user_viemodel.dart';
import 'package:nardilibraryapp/viewmodels/forgot_password_viewmodel.dart';

import 'package:nardilibraryapp/widgets/custom_app_bar.dart';
import 'package:nardilibraryapp/widgets/custom_button.dart';
import 'package:nardilibraryapp/widgets/custome_text_form_field.dart';
import 'package:nardilibraryapp/widgets/progressar.dart';
import 'package:provider/provider.dart';

class DeleteResource extends StatelessWidget {
  DeleteResource({Key? key}) : super(key: key);
  static const String routeName = "/deleteresource";
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        appBar: const CustomAppBAr(
            title: "Delete Resource", icon: Icon(Icons.arrow_back_ios_new)),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Enter Resource ID",
                    style: AppStyle.mediumText,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    headerTitle: "Resource ID",
                    hintText: "Id",
                    controller: _controller,
                    inputType: TextInputType.number),
                const SizedBox(
                  height: 38,
                ),
                CustomButton(
                  label: "DELETE RESOURCE",
                  color: Colors.red,
                  onclick: () => _submit(context),
                ),
                const SizedBox(
                  height: 50,
                ),
                ProgressBar(context.watch<DeleteUserViewmodel>().isVisible),
              ],
            ),
          ),
        ));
  }

  void _submit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      context.read<DeleteUserViewmodel>().isVisible = true;
      print(_controller.text);
      context
          .read<DeleteUserViewmodel>()
          .deleteUser(_controller.text, context);
    }
  }
}
