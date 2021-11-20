import 'package:flutter/material.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/Books.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';

class BookDetails extends StatelessWidget {
  static const routeName = "/bookDetail";

  const BookDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final book = ModalRoute.of(context)!.settings.arguments as BookTest;
    return Scaffold(
      backgroundColor: AppColors.nardOrange,
      appBar: AppBar(
        backgroundColor: AppColors.nardOrange,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          "",
          style: AppStyle.appBarText,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.bookmark_border_outlined,
              color: AppColors.white,
            ),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image(
                image: AssetImage(book.coverImage),
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            Text(book.title, style: AppStyle.whiteBoldText),
            const SizedBox(
              height: 15,
            ),
            Text(book.author, style: AppStyle.bookDetailText),
            const SizedBox(height: 20),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _bookMenu("4.5", "Ratings"),
                  VerticalDivider(
                    color: AppColors.white,
                  ),
                  _bookMenu("20", "Pages"),
                  VerticalDivider(
                    color: AppColors.white,
                  ),
                  _bookMenu("En", "Language"),
                  // VerticalDivider(
                  //    color:AppColors.white,
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 26,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(content, style: AppStyle.bookDetailBodyText)),
            ),
          ],
        ),
      )),
    );
  }

  Widget _bookMenu(String title, String subTitle) {
    return (Column(
      children: [
        Text(
          title,
          style: AppStyle.bookDetailBoldText,
        ),
        Text(subTitle, style: AppStyle.bookDetailText),
      ],
    ));
  }
}
