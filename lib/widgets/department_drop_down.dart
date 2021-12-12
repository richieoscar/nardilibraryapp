import 'package:flutter/material.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/bookresource/department.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';

class DepartmentDropDown extends StatefulWidget {
  final List<Department>? items;
  final String? hint;
  const DepartmentDropDown({this.items, this.hint});

  @override
  _DepartmentDropDownState createState() => _DepartmentDropDownState();
}

class _DepartmentDropDownState extends State<DepartmentDropDown> {
  Department? _dropDownValue;

  get dropDownValue => _dropDownValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.faintColor),
              child: DropdownButton<Department>(
                isExpanded: true,
                hint: Text(widget.hint!),
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
                  _dropDownValue = value!;
                  setState(() {
                    _dropDownValue;
                    print(_dropDownValue);
                  });
                },
                items: widget.items!.map((value) {
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
}
