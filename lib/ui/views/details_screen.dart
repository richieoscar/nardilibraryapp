import 'package:flutter/material.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/Books.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/ui/views/pdf_screen.dart';
import 'package:nardilibraryapp/viewmodels/book_detail_viewmodel.dart';
import 'package:nardilibraryapp/widgets/progressar.dart';
import 'package:provider/provider.dart';

class BookDetails extends StatefulWidget {
  static const routeName = "/bookDetail";

  final int? id;
  final String? baseFile;

  const BookDetails({this.id, this.baseFile});

  @override
  State<StatefulWidget> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetails> {
  @override
  void initState() {
    super.initState();
    getBookResourceById();
   // getPDF();
  }

  void getBookResourceById() async {
    context
        .read<BookDetailViewmodel>()
        .getBooksResourceById(context, widget.id!);

         context.read<BookDetailViewmodel>().getPDF(widget.baseFile!);
  }

  void getPDF() async {
    context.read<BookDetailViewmodel>().getPDF(widget.baseFile!);
    print("getPdf indetail screen initstate");
  }

  @override
  Widget build(BuildContext context) {
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
            child: Icon(
              Icons.bookmark_border_outlined,
              color: AppColors.nardBlack,
            ),
          )
        ],
      ),
      body: SafeArea(
          child: context.watch<BookDetailViewmodel>().isLoading
              ? ProgressBar(context.watch<BookDetailViewmodel>().isLoading)
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
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 200,
                              height: 200,
                              child: Card(
                                elevation: 10,
                                child: Image.network(
                                  context
                                      .watch<BookDetailViewmodel>()
                                      .book
                                      .thumbnail,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                context.watch<BookDetailViewmodel>().book.name,
                                style: AppStyle.blackBoldText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              context.watch<BookDetailViewmodel>().book.author,
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
                                  // VerticalDivider(
                                  //    color:AppColors.white,
                                  // ),
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
                                    .description,
                                style: AppStyle.bookDetailBodyText)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            String? path =
                                context.read<BookDetailViewmodel>().filePath;

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PDFScreen(path: path!),
                              ),
                            );
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
                              child: Text("READ BOOK",
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

  void openPdf(String filePath) {}

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
