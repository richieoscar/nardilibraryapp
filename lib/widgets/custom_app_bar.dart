import 'package:flutter/material.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';

class CustomAppBAr extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Icon? icon;
  final Color? iconColor;
  final VoidCallback? onPressed;
  const CustomAppBAr({required this.title, this.icon, this.iconColor, this.onPressed});

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
      centerTitle: false,
      title: Text(
        title,
        style: AppStyle.appBarText,
      ),
      actions: [GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: icon!,
        ))],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
