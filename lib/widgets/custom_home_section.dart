import 'package:flutter/material.dart';
import 'package:nardilibraryapp/model/Books.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/ui/views/details_screen.dart';


class HomeSection extends StatelessWidget {
  final String sectionTitle;
  final VoidCallback? seeMore;
  final List<Book> books;
  HomeSection(
      {required this.sectionTitle, required this.books, required this.seeMore});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(sectionTitle, style: AppStyle.sectionTitleText),
                TextButton(
                  onPressed: seeMore,
                  child: Text(
                    "See all",
                    style: AppStyle.yelloSmalText,
                  ),
                ),
              ],
            ),
          ),
           SizedBox(
              height: 150,
              child: ListView.builder(
                  itemCount: books.length,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, BookDetails.routeName, arguments:Book(books[index].title, books[index].coverImage, books[index].author));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.rectangle,
                           
                          ),
                          child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage(books[index].coverImage)),
                        ),
                      ),
                    );
                  }),
            ),
          
        ],
      ),
    );
  }
}
