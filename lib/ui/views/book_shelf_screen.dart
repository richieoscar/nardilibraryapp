import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nardilibraryapp/model/Books.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/widgets/book_shelf_list.dart';
import 'package:nardilibraryapp/widgets/books_shelf_empty.dart';
import 'package:nardilibraryapp/widgets/custom_app_bar.dart';

class BookShelf extends StatelessWidget {
  const BookShelf({Key? key}) : super(key: key);
  static const routeName = "/bookShelf";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          
          centerTitle: true,
          title: Text(
            "NardLibrary",
            style: AppStyle.appBarText,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.clear_all_outlined,
                color: AppColors.nardBlack,
              ),
            )
          ],
        ),
        body: SafeArea(
          child: BookTest.getbooks().isEmpty ? const BookShelfEmpty(): const BookShelfList()
        ));
  }
}




