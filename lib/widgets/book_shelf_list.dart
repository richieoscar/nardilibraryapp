import 'package:flutter/material.dart';
import 'package:nardilibraryapp/model/Books.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
class BookShelfList extends StatelessWidget {
  const BookShelfList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Book.getbooks().length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        height: 100,
                        child: Image(
                          filterQuality: FilterQuality.medium,
                          fit: BoxFit.fill,
                          image: AssetImage(
                            Book.getbooks()[index].coverImage,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Book.getbooks()[index].title,
                            style: AppStyle.mediumText,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(Book.getbooks()[index].author)
                        ],
                      ),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.headphones,
                      color: AppColors.pasejicBlack,
                    ))
              ],
            ),
          );
        });
  }
}