import 'package:flutter/material.dart';
import 'package:nardilibraryapp/model/Books.dart';
import 'package:nardilibraryapp/model/bookresource/book.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/ui/views/details_screen.dart';
import 'package:nardilibraryapp/util/utils.dart';
import 'package:nardilibraryapp/widgets/cache_image.dart';

class HomeSection extends StatelessWidget {
  final String sectionTitle;
  final VoidCallback? seeMore;
  final List<Book> books;
  final Axis? axis;
  final bool? isConnected;
  HomeSection(
      {required this.sectionTitle,
      required this.books,
      required this.seeMore,
      this.axis = Axis.horizontal,
      this.isConnected = true});

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
                physics: BouncingScrollPhysics(),
                scrollDirection: axis!,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if(isConnected!){
                           int id = books[index].getId!;
                      String baseFile = books[index].baseFile!;
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
                      }

                      else {
                        AppUtils.showSnackBarforNetwork(context, "No Network Connection");
                      }
                      
                     
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                        ),
                        child:CacheImage(imageUrl:  books[index].thumbnail,))
                      ),
                    
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget noNetworImage() {
    return const  Image(fit: BoxFit.fill, image: AssetImage("assets/nobooks.png"));
  }
}
