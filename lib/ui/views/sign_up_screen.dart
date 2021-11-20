import 'package:flutter/material.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/auth/user_info.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/viewmodels/signup_viewmodel.dart';
import 'package:nardilibraryapp/widgets/custom_button.dart';
import 'package:nardilibraryapp/widgets/custome_text_form_field.dart';
import 'package:nardilibraryapp/widgets/password_text_field.dart';
import 'package:nardilibraryapp/widgets/progressar.dart';
import 'package:provider/provider.dart';

import 'forgot_password_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _folioController = TextEditingController();
  final TextEditingController _institutionController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _commencementController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _genderDropDownValue;
  String? _stateDropDownValue;
  bool isChecked = false;
  bool notChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 29,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Create an Account",
                    style: AppStyle.headline1,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text("Create a new account with Nardlibrary",
                      style: AppStyle.smallText),
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                    headerTitle: "Firstname",
                    hintText: "Firstname",
                    controller: _firstnameController,
                    inputType: TextInputType.text),
                const SizedBox(height: 10),
                CustomTextFormField(
                    headerTitle: "Lastname",
                    hintText: "Lastname",
                    controller: _lastnameController,
                    inputType: TextInputType.text),
                const SizedBox(height: 10),
                CustomTextFormField(
                  headerTitle: "Username",
                  hintText: "Username",
                  controller: _usernameController,
                  inputType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                    headerTitle: "Email",
                    hintText: "Email",
                    controller: _emailController,
                    inputType: TextInputType.emailAddress),
                const SizedBox(height: 10),
                CustomTextFormField(
                    headerTitle: "Phone Number",
                    hintText: "Phone Number",
                    controller: _phoneNumberController,
                    inputType: TextInputType.phone),
                const SizedBox(height: 10),
                CustomTextFormField(
                    headerTitle: "Folio",
                    hintText: "Folio",
                    controller: _folioController,
                    inputType: TextInputType.number),
                const SizedBox(height: 10),
                CustomTextFormField(
                    headerTitle: "Role",
                    hintText: "Role",
                    controller: _roleController,
                    inputType: TextInputType.number),
                const SizedBox(height: 10),
                PasswordTextFormField(
                  headerTitle: "Password",
                  hintText: "Password",
                  controller: _passwordController,
                ),
                const SizedBox(height: 10),
                PasswordTextFormField(
                    headerTitle: "Confirm Password",
                    hintText: "Confirm Password",
                    controller: _confirmPasswordController),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Checkbox(
                        activeColor: AppColors.backgroundColor,
                        value: isChecked,
                        onChanged: (value) {
                          isChecked = context
                              .read<SignUpViewmodel>()
                              .isChecked = value!;
                        }),
                    Text("I agree to all the ", style: AppStyle.smallText),
                    InkWell(
                        onTap: () {},
                        child: Text("terms & condition of",
                            style: AppStyle.blueText)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text("Nardlibrary", style: AppStyle.smallText),
                ),
                const SizedBox(height: 51),
                CustomButton(label: "SIGN UP", onclick: () => _signUp()),
                const SizedBox(height: 42),
                ProgressBar(context.watch<SignUpViewmodel>().isVisible),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already a member? ", style: AppStyle.verSmallText),
                    InkWell(
                        child: Text(
                      "Login",
                      style: AppStyle.blueText,
                    ))
                  ],
                ),
                const SizedBox(height: 42),
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
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    _stateController.dispose();
    _folioController.dispose();
    _departmentController.dispose();
    _institutionController.dispose();
    _roleController.dispose();
    _commencementController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _designationController.dispose();
    _dobController.dispose();
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      context.read<SignUpViewmodel>().isVisible = true;
      UserInfo info = UserInfo(
          _usernameController.text.trim(),
          _passwordController.text.trim(),
          "",
          "",
          "",
          "",
          "",
          _emailController.text.trim(),
          _firstnameController.text.trim(),
          _folioController.text.trim(),
          "",
          "",
          "",
          _phoneNumberController.text.trim(),
          "",
          "",
          _lastnameController.text.trim());
      context
          .read<SignUpViewmodel>()
          .signUpUser(info, _confirmPasswordController.text.trim(), context);
    }
  }

  Widget _genderDropDown(
      String title, List<String> genders, String? dropDownValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(title, style: AppStyle.smallBoldText),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.faintColor),
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Text("Select"),
                value: dropDownValue,
                icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_drop_down_rounded,
                    )),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: AppColors.nardBlack),
                onChanged: (value) {
                  _genderDropDownValue = value!;
                  setState(() {
                    _genderDropDownValue;
                    print(_genderDropDownValue);
                  });
                },
                items: genders.map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(value),
                    ),
                  );
                }).toList(),
              )),
        ),
      ],
    );
  }

  Widget _stateDropDown(
      String title, List<String> states, String? dropDownValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(title, style: AppStyle.smallBoldText),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.faintColor),
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Text("Select"),
                value: dropDownValue,
                icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_drop_down_rounded,
                    )),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: AppColors.nardBlack),
                onChanged: (value) {
                  _stateDropDownValue = value!;
                  setState(() {
                    _stateDropDownValue;
                    print(_stateDropDownValue);
                  });
                },
                items: states.map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(value),
                    ),
                  );
                }).toList(),
              )),
        ),
      ],
    );
  }
}
