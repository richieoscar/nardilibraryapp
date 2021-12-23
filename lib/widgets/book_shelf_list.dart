import 'package:flutter/material.dart';
import 'package:nardilibraryapp/model/Books.dart';
import 'package:nardilibraryapp/model/bookresource/book.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/viewmodels/book_shelf_viewmodel.dart';
import 'package:nardilibraryapp/widgets/custom_home_section.dart';
import 'package:nardilibraryapp/widgets/custom_shelf.dart';
import 'package:provider/provider.dart';

class BookShelfList extends StatelessWidget {
  final List<Book>? shelvedbooks;
  const BookShelfList({required this.shelvedbooks});

  @override
  Widget build(BuildContext context) {
    var viewmodel = Provider.of<BookShelfViewmodel>(context);
    return SafeArea(
        child: Column(
      children: [
        ShelfSection(
          
            books: viewmodel.shelvedBooks,
            
          )
      ],
    ));
  }
}
