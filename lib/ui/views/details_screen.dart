import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/Books.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/ui/views/pdf_screen.dart';
import 'package:nardilibraryapp/util/utils.dart';
import 'package:nardilibraryapp/viewmodels/book_detail_viewmodel.dart';
import 'package:nardilibraryapp/widgets/cache_image.dart';
import 'package:nardilibraryapp/widgets/progressar.dart';
import 'package:provider/provider.dart';
import 'package:nardilibraryapp/model/shelf/add_to_shelf.dart';

class BookDetails extends StatefulWidget {
  static const routeName = "/bookDetail";

  final int? id;
  final String? baseFile;

  const BookDetails({this.id, this.baseFile});

  @override
  State<StatefulWidget> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetails> {
  File? _file;
  String? _status = 'READ BOOK';
  @override
  void initState() {
    super.initState();
    getBookResourceById();
    getPDF();
  }

  void getBookResourceById() async {
    print(widget.id);
    await context
        .read<BookDetailViewmodel>()
        .getBooksResourceById(context, widget.id!);
  }

  void getPDF() async {
    _file = await context.read<BookDetailViewmodel>().getPDF(widget.baseFile!);
    _file != null ? displayResourceReady() : null;
  }

  void displayResourceReady() {
    setState(() {
      _status = "READ BOOK";
    });
    AppUtils.showSnackBar(context, "Resource ready!");
  }

  @override
  Widget build(BuildContext context) {
    var viewmodel = Provider.of<BookDetailViewmodel>(context);
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.nardBlack,
          ),
        ),
        centerTitle: false,
        title: Text(
          "Detail",
          style: AppStyle.appBarText,
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: IconButton(
                  onPressed: () {
                    int? resourceID = widget.id;
                    String? username = viewmodel.username();
                    AddToShelf shelf = AddToShelf(resourceID, username);
                    print(resourceID);
                    print(username);
                    viewmodel.addToShelf(shelf, context);
                  },
                  icon: Icon(Icons.bookmark_border_outlined,
                      color: AppColors.nardBlack)))
        ],
      ),
      body: SafeArea(
          child: viewmodel.isLoading
              ? ProgressBar(viewmodel.isLoading)
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        color: AppColors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 200,
                              height: 200,
                              child: Card(
                                elevation: 10,
                                child: CacheImage(imageUrl:
                                  viewmodel.book.thumbnail ??
                                      "assets/nobook.png",

                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                context
                                        .watch<BookDetailViewmodel>()
                                        .book
                                        .name ??
                                    "",
                                style: AppStyle.blackBoldText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Author: ${context.watch<BookDetailViewmodel>().book.author ?? ''}",
                              style: AppStyle.bookDetailText,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _bookMenu("4.5", "Ratings"),
                                  VerticalDivider(
                                    color: AppColors.nardDark,
                                  ),
                                  _bookMenu(
                                      context
                                          .watch<BookDetailViewmodel>()
                                          .book
                                          .pages
                                          .toString(),
                                      "Pages"),
                                  VerticalDivider(
                                    color: AppColors.nardDark,
                                  ),
                                  _bookMenu("En", "Language"),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 26,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Description",
                          style: AppStyle.descriptionText,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                                context
                                        .watch<BookDetailViewmodel>()
                                        .book
                                        .description ??
                                    "No description",
                                style: AppStyle.bookDetailBodyText)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            String? title =
                                context.read<BookDetailViewmodel>().book.name;
                            _file == null
                                ? displayLoading(context)
                                : openPdf(context, title);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.backgroundColor),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              child: Text(_status!,
                                  style: AppStyle.whiteBoldText,
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
    );
  }

  void displayLoading(BuildContext context) {
    setState(() {
      _status = "Loading resource...";
    });
    return AppUtils.showSnackBar(context, "Please wait, preparing resource");
  }

  void openPdf(BuildContext context, String? title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFScreen(file: _file!, title: title!),
      ),
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
