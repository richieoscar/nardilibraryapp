import 'package:flutter/material.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';

class GenderDropDown extends StatelessWidget {
  GenderDropDown(this.title, this.genders, this.dropDownValue);
  final String title;
  final List<String> genders;
  final String dropDownValue;
  String? _genderDropDownValue;

  @override
  Widget build(BuildContext context) {
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
}
