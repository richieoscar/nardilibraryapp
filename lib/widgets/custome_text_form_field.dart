import 'package:flutter/material.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';

class CustomTextFormField extends StatelessWidget {
  final String headerTitle;
  final String hintText;
  final TextEditingController controller;
  CustomTextFormField(
      {required this.headerTitle,
      required this.hintText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(headerTitle, style: AppStyle.smallBoldText),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.faintColor),
            child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(left: 10),
                  hintText: hintText,
                  hintStyle: const TextStyle(fontSize: 12),
                  fillColor: AppColors.faintColor,
                  focusColor: AppColors.backgroundColor,
                ),
                inputFormatters: [
                  // TextInputType.datetime
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required";
                  }
                  return null;
                }),
          ),
        ),
      ],
    );
  }
}
