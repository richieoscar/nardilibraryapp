import 'package:flutter/material.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/resources/app_style.dart';

class AdminOptions extends StatelessWidget {
  final String? title;
  final IconData? iconData;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onpressed;
  AdminOptions(
      {this.title,
      this.iconData,
      this.color = KDefaltWhite,
      this.backgroundColor = KDefaultButtonColor, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        child: Column(
          children: [
            SizedBox(
              child: Card(
                elevation: 10,
                color: backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(
                    iconData,
                    size: 70,
                    color: color!,
                  ),
                ),
              ),
            ),
            Text(title!, style: AppStyle.smallText)
          ],
        ),
      ),
    );
  }
}
