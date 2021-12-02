import 'package:flutter/material.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';

class AppUtils {
  static void showSnackBar(BuildContext context, String message) {
    SnackBar snackBar = SnackBar(
      backgroundColor: AppColors.backgroundColor,
      dismissDirection: DismissDirection.horizontal,
      elevation: 4,
      duration: Duration(seconds: 3),
      content: Text(message));
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


}
