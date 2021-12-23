import 'package:flutter/material.dart';
import 'package:nardilibraryapp/model/Books.dart';
import 'package:nardilibraryapp/model/bookresource/book.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/ui/views/details_screen.dart';

class ShelfSection extends StatelessWidget {
  final List<Book> books;

  ShelfSection({
  
    required this.books,
    
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          ListView.builder(
                itemCount: books.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
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
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Image(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(books[index].thumbnail)),
                              ),
                              SizedBox(width: 10,),

                              Column(
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(books[index].name, style: AppStyle.smallText, softWrap: true,)),
                                    
                                    
                                ],
                              )
                             
                            ],
                          ),
                           Icon(Icons.delete, color: Colors.red[300],)
                        ],
                      ),
                    ),
                  );
                }),
        ],
      
      
    );
  }
}
