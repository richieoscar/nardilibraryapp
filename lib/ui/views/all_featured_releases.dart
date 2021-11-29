import 'package:flutter/material.dart';
import 'package:nardilibraryapp/model/bookresource/department.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/ui/views/details_screen.dart';
import 'package:nardilibraryapp/viewmodels/all_featured_viewmodel.dart';
import 'package:nardilibraryapp/viewmodels/departments_viewmodel.dart';
import 'package:nardilibraryapp/widgets/custom_app_bar.dart';
import 'package:nardilibraryapp/widgets/progressar.dart';
import 'package:provider/provider.dart';

import 'department_book.dart';

class AllFeaturedRelease extends StatefulWidget {
  static const route = 'featured';

  @override
  State<StatefulWidget> createState() => _AllFeaturedRelease();
}

class _AllFeaturedRelease extends State<AllFeaturedRelease> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: CustomAppBAr(
        title: 'Featured Releases',
        icon: Icon(
          Icons.ac_unit,
          color: AppColors.white,
        ),
      ),
      body: context.watch<AllFeaturedViewmodel>().isLoading
          ? ProgressBar(context.watch<AllFeaturedViewmodel>().isLoading)
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
                  //mainAxisSpacing: 5,
                  crossAxisSpacing: 2),
              itemCount: context.read<AllFeaturedViewmodel>().lenght,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      int id = context
                          .watch<AllFeaturedViewmodel>()
                          .featuredBooks[index]
                          .id;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetails(
                            id: id,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                        ),
                        child: Card(
                          elevation: 1,
                          color: AppColors.white,
                          child: Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(context
                                  .watch<AllFeaturedViewmodel>()
                                  .featuredBooks[index]
                                  .thumbnail)),
                        ),
                      ),
                    ));
              }),
    );
  }
}
