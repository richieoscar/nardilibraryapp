import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nardilibraryapp/model/Books.dart';
import 'package:nardilibraryapp/model/shelf/add_to_shelf.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/ui/views/details_screen.dart';
import 'package:nardilibraryapp/viewmodels/book_shelf_viewmodel.dart';
import 'package:nardilibraryapp/widgets/book_shelf_list.dart';
import 'package:nardilibraryapp/widgets/books_shelf_empty.dart';
import 'package:nardilibraryapp/widgets/custom_app_bar.dart';
import 'package:nardilibraryapp/widgets/progressar.dart';
import 'package:provider/provider.dart';

class BookShelf extends StatefulWidget {
  const BookShelf({Key? key}) : super(key: key);
  static const routeName = "/bookShelf";

  @override
  State<StatefulWidget> createState() => _BookShelfState();
}

class _BookShelfState extends State<BookShelf> {
  @override
  void initState() {
    context.read<BookShelfViewmodel>().getShelvedBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var viewmodel = Provider.of<BookShelfViewmodel>(context);
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
        child: viewmodel.isLoading
            ? ProgressBar(viewmodel.isLoading)
            : Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Your Book Shelf",
                    style: AppStyle.shelfHeadlineText,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  viewmodel.isShelfEmpty
                      ? BookShelfEmpty()
                      : Expanded(
                          child: Consumer<BookShelfViewmodel>(builder:(_,viewmodel,__)=>
                             ListView.builder(
                              itemCount: viewmodel.shelvedBooks.length,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    int id = viewmodel.shelvedBooks[index].getId!;
                                    String baseFile =
                                        viewmodel.shelvedBooks[index].baseFile!;
                                    print(id);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BookDetails(
                                          id: id,
                                          baseFile: baseFile,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 80,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Image(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(viewmodel
                                                      .shelvedBooks[index]
                                                      .thumbnail)),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  width: 150,
                                                  child: Text(
                                                    viewmodel
                                                        .shelvedBooks[index].name,
                                                    style: AppStyle.smallText,
                                                    softWrap: true,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            int id = viewmodel
                                                .shelvedBooks[index].getId!;
                                            String? username = viewmodel.username;
                                            print(id);
                                            print(username);
                                            viewmodel.removeFromShelf(
                                                AddToShelf(id, username),
                                                context);
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red[300],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                ],
              ),
      ),
    );
  }
}
