

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/ui/views/details_screen.dart';
import 'package:nardilibraryapp/ui/views/pdf_screen.dart';

class AppUtils {
  static void showSnackBar(BuildContext context, String message) {
    SnackBar snackBar = SnackBar(
        backgroundColor: AppColors.backgroundColor,
        dismissDirection: DismissDirection.horizontal,
        elevation: 8,
        duration: Duration(seconds: 3),
        content: Text(message, style:AppStyle.snackBarText));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Widget hideProgressBar(BuildContext context) {
    return const Visibility(
      visible: false,
      child: CircularProgressIndicator(),
    );
  }

  

  static Widget showProgressBar(BuildContext context) {
    return const Visibility(
      visible: false,
      child: CircularProgressIndicator(),
    );
  }

  static void openBookDetail({BuildContext? context, int? id,String? baseFile }) {
    Navigator.push(
      context!,
      MaterialPageRoute(
        builder: (context) =>  BookDetails(id:id, baseFile:baseFile ,),
      ),
    );
  }
}
