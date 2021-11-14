import 'package:flutter/material.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
class BookShelfEmpty extends StatelessWidget {
  const BookShelfEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Icon(
            Icons.my_library_books_rounded,
            size: 100,
            color: AppColors.lightDark,
          ),
          SizedBox(
            height: 30,
          ),
          Text("Sorry you do not have any books ",
              style: AppStyle.mediumText),
              SizedBox(
            height: 20,
          ),
              Text("Add From Library ",
              style: AppStyle.smallText),
        ],
      ),
    );
  }
}