import 'package:flutter/material.dart';
import 'package:nardilibraryapp/model/bookresource/department.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/widgets/custom_app_bar.dart';
import 'package:nardilibraryapp/widgets/custom_button.dart';
import 'package:nardilibraryapp/widgets/custome_text_form_field.dart';
import 'package:nardilibraryapp/widgets/drop_down.dart';

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

  List<String> isPublished = ['Published', 'Not Published'];

  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Add Resource',
          style: AppStyle.appBarText,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CustomDropDown(
              items: isPublished,
              hint: "Select Department",
            ),
            SizedBox(
              height: 10,
            ),
            CustomDropDown(
              items: isPublished,
              hint: 'Is article published?',
            ),
            SizedBox(
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
                controller: _controller,
                inputType: TextInputType.text),
            CustomTextFormField(
                headerTitle: 'Description',
                hintText: 'Enter book Description',
                controller: _controller,
                inputType: TextInputType.text),
            CustomTextFormField(
                headerTitle: 'Author',
                hintText: 'Author name',
                controller: _controller,
                inputType: TextInputType.text),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.lightDark),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    'Select File',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
                label: "Upload",
                onclick: () {},
                color: AppColors.backgroundColor),
          ],
        ),
      ),
    );
  }
}
