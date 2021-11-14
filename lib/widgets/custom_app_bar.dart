import 'package:flutter/material.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';

class CustomAppBAr extends StatelessWidget implements PreferredSizeWidget {
  final String title;
   final Icon icon;
  const CustomAppBAr({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back_ios_new, 
          color: AppColors.pasejicBlack,
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: AppStyle.appBarText,
      ),
      actions: [icon],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
