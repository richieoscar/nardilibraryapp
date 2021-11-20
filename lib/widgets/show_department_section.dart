import 'package:flutter/material.dart';
import 'package:nardilibraryapp/model/Books.dart';
import 'package:nardilibraryapp/model/bookresource/book.dart';
import 'package:nardilibraryapp/model/bookresource/department.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/ui/views/details_screen.dart';

class DepartmentSection extends StatelessWidget {
  final String sectionTitle;
  final VoidCallback? seeMore;
  final List<Department> departments;
  DepartmentSection(
      {required this.sectionTitle, required this.departments, required this.seeMore});

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
            
            child: ListView.builder(
                itemCount: departments.length,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, BookDetails.routeName,
                          arguments: departments[index].id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                        ),
                        child: Card(
                        elevation: 5,
                        color: AppColors.backgroundColor,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              
                              departments[index].name, style: AppStyle.whiteText,
                              textAlign: TextAlign.center,
                              ),
                          ),
                        ),
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
