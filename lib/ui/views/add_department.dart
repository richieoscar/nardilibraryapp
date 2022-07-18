import 'package:flutter/material.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/viewmodels/delete_user_viemodel.dart';
import 'package:nardilibraryapp/widgets/custom_app_bar.dart';
import 'package:nardilibraryapp/widgets/custom_button.dart';
import 'package:nardilibraryapp/widgets/custome_text_form_field.dart';
import 'package:nardilibraryapp/widgets/progressar.dart';
import 'package:provider/provider.dart';

class AddDepartment extends StatelessWidget {
  AddDepartment({Key? key}) : super(key: key);
  static const String routeName = "/addDepartment";
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBAr(
            title: "Add Department", icon: Icon(Icons.arrow_back_ios_new)),
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
                    "Enter Department Name",
                    style: AppStyle.mediumText,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    headerTitle: "Department Name",
                    hintText: "Name",
                    controller: _controller,
                    inputType: TextInputType.text),
                const SizedBox(
                  height: 38,
                ),
                CustomButton(
                  label: "ADD ",
                  color: AppColors.backgroundColor,
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
          .addDepartment(_controller.text, context);
      _controller.text = "";
    }
  }
}
