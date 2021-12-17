import 'package:flutter/material.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/auth/user_info.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/viewmodels/login_form_viewmodel.dart';
import 'package:nardilibraryapp/viewmodels/signup_viewmodel.dart';
import 'package:nardilibraryapp/widgets/custom_app_bar.dart';
import 'package:nardilibraryapp/widgets/custom_button.dart';
import 'package:nardilibraryapp/widgets/custome_text_form_field.dart';
import 'package:nardilibraryapp/widgets/password_text_field.dart';
import 'package:nardilibraryapp/widgets/progressar.dart';
import 'package:provider/provider.dart';

import 'forgot_password_screen.dart';

class AdminUpdateUserProfile extends StatefulWidget {
  static const route = '/adminupdateProfile';
  const AdminUpdateUserProfile({Key? key}) : super(key: key);

  @override
  _AdminUpdateUserProfileState createState() => _AdminUpdateUserProfileState();
}

class _AdminUpdateUserProfileState extends State<AdminUpdateUserProfile> {
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
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _otherNameController = TextEditingController();
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
    initControllers();
    final viewmodel = Provider.of<LoginFormViewModel>(context);
    return Scaffold(
      appBar: CustomAppBAr(title: "Admin", icon: Icon(Icons.ac_unit)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Update User",
                    style: AppStyle.headline1,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    headerTitle: "Firstname",
                    hintText: viewmodel.user!.firstName,
                    controller: _firstnameController,
                    inputType: TextInputType.text),
                const SizedBox(height: 10),
                CustomTextFormField(
                    headerTitle: "Lastname",
                    hintText: viewmodel.user!.surname ?? "",
                    controller: _lastnameController,
                    inputType: TextInputType.text),
                const SizedBox(height: 10),
                CustomTextFormField(
                  headerTitle: "Username",
                  hintText: viewmodel.user!.userName ?? "",
                  controller: _usernameController,
                  inputType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                    headerTitle: "Email",
                    hintText: viewmodel.user!.email ?? "",
                    controller: _emailController,
                    inputType: TextInputType.emailAddress),
                const SizedBox(height: 10),
                CustomTextFormField(
                    headerTitle: "Phone Number",
                    hintText: viewmodel.user!.phone ?? "",
                    controller: _phoneNumberController,
                    inputType: TextInputType.phone),
                const SizedBox(height: 10),
                CustomTextFormField(
                    headerTitle: "Gender",
                    hintText: viewmodel.user!.gender ?? "",
                    controller: _genderController,
                    inputType: TextInputType.text),
                const SizedBox(height: 10),
                CustomTextFormField(
                    headerTitle: "Institution",
                    hintText: viewmodel.user!.institution ?? "",
                    controller: _institutionController,
                    inputType: TextInputType.text),
                CustomTextFormField(
                    headerTitle: "DOB( dd/mm/yy )",
                    hintText: viewmodel.user!.dob ?? "",
                    controller: _dobController,
                    inputType: TextInputType.number),
                     CustomTextFormField(
                    headerTitle: "Role ( 1 or 2 )",
                    hintText: viewmodel.user!.role.toString() ?? "",
                    controller: _dobController,
                    inputType: TextInputType.number),
                CustomTextFormField(
                    headerTitle: "Address",
                    hintText: viewmodel.user!.address ?? "",
                    controller: _addressController,
                    inputType: TextInputType.text),
                CustomTextFormField(
                    headerTitle: "Designation",
                    hintText: viewmodel.user!.designation ?? "",
                    controller: _designationController,
                    inputType: TextInputType.text),
                CustomTextFormField(
                    headerTitle: "Department",
                    hintText: viewmodel.user!.department ?? "",
                    controller: _departmentController,
                    inputType: TextInputType.text),
                CustomTextFormField(
                    headerTitle: "Commencement Year",
                    hintText: viewmodel.user!.commencementYear,
                    controller: _commencementController,
                    inputType: TextInputType.number),
                const SizedBox(height: 10),
                CustomButton(label: "SAVE", onclick: () => _save(), color: Colors.green),
                const SizedBox(height: 42),
                ProgressBar(context.watch<LoginFormViewModel>().isVisible),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void initControllers() {
    final viewmodel = Provider.of<LoginFormViewModel>(context);

    viewmodel.user!.firstName != null
        ? _firstnameController.text = viewmodel.user!.firstName
        : null;
    viewmodel.user!.surname != null
        ? _lastnameController.text = viewmodel.user!.surname
        : null;
    viewmodel.user!.userName != null
        ? _usernameController.text = viewmodel.user!.userName
        : null;
    viewmodel.user!.email != null
        ? _emailController.text = viewmodel.user!.email
        : null;
    viewmodel.user!.phone != null
        ? _phoneNumberController.text = viewmodel.user!.phone
        : null;
    viewmodel.user!.firstName != null
        ? _genderController.text = viewmodel.user!.gender
        : null;

    viewmodel.user!.institution != null
        ? _institutionController.text = viewmodel.user!.institution
        : null;
    viewmodel.user!.dob != null
        ? _dobController.text = viewmodel.user!.dob
        : null;
    viewmodel.user!.address != null
        ? _addressController.text = viewmodel.user!.address
        : null;
    viewmodel.user!.designation != null
        ? _designationController.text = viewmodel.user!.designation
        : null;
    viewmodel.user!.department != null
        ? _departmentController.text = viewmodel.user!.department
        : null;

    viewmodel.user!.commencementYear != null
        ? _commencementController.text = viewmodel.user!.commencementYear
        : null;
         viewmodel.user!.role != null
        ? _roleController.text = viewmodel.user!.role.toString()
        : null;
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
    _genderController.dispose();
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginFormViewModel>().isVisible = true;
      UserInfo info = UserInfo(
          _usernameController.text.trim(),
          context.read<LoginFormViewModel>().user!.password,
          _addressController.text.trim(),
          _commencementController.text.trim(),
          _departmentController.text.trim(),
          _designationController.text.trim(),
          _dobController.text.trim(),
          _emailController.text.trim(),
          _firstnameController.text.trim(),
          context.read<LoginFormViewModel>().user!.folio,
          _genderController.text.trim(),
          _institutionController.text.trim(),
          _otherNameController.text.trim(),
          _phoneNumberController.text.trim(),
          int.parse(_roleController.text.trim()),
          _stateController.text.trim(),
          _lastnameController.text.trim());
      context.read<LoginFormViewModel>().updateUser(info, context);
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
