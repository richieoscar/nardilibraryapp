import 'package:flutter/material.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
class CustomDropDown extends StatefulWidget {
  const CustomDropDown({ Key? key }) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {

  var _dropDownValue = "Male";

  String get dropDownValue=>_dropDownValue;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text("Gender", style: AppStyle.smallBoldText),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                  color: AppColors.faintColor),
            child:  DropdownButton<String>(
            value: _dropDownValue,
            icon: const Icon(Icons.arrow_drop_down_rounded),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                _dropDownValue = newValue!;
              });
            },
            items: gender
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )
          ),
        ),
      ],
    );
  }
}