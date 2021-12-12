import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:nardilibraryapp/model/bookresource/add_resource.dart';
import 'package:nardilibraryapp/model/bookresource/department.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/util/utils.dart';
import 'package:nardilibraryapp/viewmodels/department_books_viewmodel.dart';
import 'package:nardilibraryapp/viewmodels/departments_viewmodel.dart';
import 'package:nardilibraryapp/widgets/custom_app_bar.dart';
import 'package:nardilibraryapp/widgets/custom_button.dart';
import 'package:nardilibraryapp/widgets/custome_text_form_field.dart';
import 'package:nardilibraryapp/widgets/department_drop_down.dart';
import 'package:nardilibraryapp/widgets/drop_down.dart';
import 'package:nardilibraryapp/widgets/progressar.dart';
import 'package:provider/provider.dart';

class AddResource extends StatefulWidget {
  static const route = '/addresource';

  const AddResource({Key? key}) : super(key: key);

  @override
  _AddResourceState createState() => _AddResourceState();
}

class _AddResourceState extends State<AddResource> {
  List<Department> department = [
    Department(1, 'Meicine'),
    Department(2, 'Dermatology'),
    Department(3, 'Surgery')
  ];
  PlatformFile? platFormfile;
  File? file;
  String? fileName;
  Department? _departmentDropDownValue;
  String? _publishedDropDownValue;

  List<String> isPublished = ['Published', 'Not Published'];

  TextEditingController _controllerAuthor = TextEditingController();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerDescription = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var viewmodel = Provider.of<AllDepartmentsViewmodel>(context);
    return Scaffold(
      appBar: CustomAppBAr(
        title: "Add Resource",
        icon: Icon(Icons.ac_unit),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _departmentDropDown("Departments", viewmodel.departments,
                    _departmentDropDownValue),
                _publishedDropDown(
                    "Published", isPublished, _publishedDropDownValue),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    height: 6,
                    color: AppColors.nardOrange,
                  ),
                ),
                CustomTextFormField(
                    headerTitle: 'Title',
                    hintText: 'Title',
                    controller: _controllerName,
                    inputType: TextInputType.text),
                CustomTextFormField(
                    headerTitle: 'Description',
                    hintText: 'Enter book Description',
                    controller: _controllerDescription,
                    inputType: TextInputType.text),
                CustomTextFormField(
                    headerTitle: 'Author',
                    hintText: 'Author name',
                    controller: _controllerAuthor,
                    inputType: TextInputType.text),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.lightDark),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          pickFile();
                        },
                        child: const Text(
                          'Select File',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                file == null
                    ? Text("No file selected")
                    : Text(fileName!, style: AppStyle.mediumBoldText),
                const SizedBox(height: 20),
                CustomButton(
                    label: "Upload",
                    onclick: () {
                      viewmodel.isLoading = true;
                      if (_departmentDropDownValue == null) {
                        AppUtils.showSnackBar(context, "Select a Department ");
                      }
                      if(_publishedDropDownValue==null){
                         AppUtils.showSnackBar(context, "Published is not Selected");
                      }
                       if(fileName==null){
                         AppUtils.showSnackBar(context, "File not Selected");
                      }
                      if (_formKey.currentState!.validate()) {
                        String filee = file!.path;
                        BookResource resource = BookResource(
                            filee,
                            _controllerName.text,
                            "Text",
                            _departmentDropDownValue!.id!.toString(),
                            _publishedDropDownValue,
                            _controllerDescription.text,
                            _controllerAuthor.text);

                        viewmodel.addResource(resource, context);
                        print(resource);
                      }
                    },
                    color: Colors.purple),
                SizedBox(height: 20),
                ProgressBar(viewmodel.isVisible)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null) {
      setState(() {
        platFormfile = result.files.first;
        file = File(platFormfile!.path!);
        fileName = result.files.first.name;
      });
    }
  }

  Widget _departmentDropDown(
      String title, List<Department> departments, Department? dropDownValue) {
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
              child: DropdownButton<Department>(
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
                  _departmentDropDownValue = value!;
                  setState(() {
                    _departmentDropDownValue;
                  });
                },
                items: departments.map((value) {
                  return DropdownMenuItem<Department>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(value.name),
                    ),
                  );
                }).toList(),
              )),
        ),
      ],
    );
  }

  Widget _publishedDropDown(
      String title, List<String> isPublished, String? dropDownValue) {
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
                  _publishedDropDownValue = value!;
                  setState(() {
                    _departmentDropDownValue;
                  });
                },
                items: isPublished.map((value) {
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
