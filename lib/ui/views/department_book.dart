import 'package:flutter/material.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/ui/views/details_screen.dart';
import 'package:nardilibraryapp/viewmodels/department_books_viewmodel.dart';
import 'package:nardilibraryapp/widgets/custom_app_bar.dart';
import 'package:nardilibraryapp/widgets/no_resource.dart';

import 'package:nardilibraryapp/widgets/progressar.dart';
import 'package:provider/provider.dart';

class DepartmentBooks extends StatefulWidget {
  static const route = 'departmentBooks';
  int? departmentId;
  String? departmentName;

  DepartmentBooks({this.departmentId, this.departmentName});

  @override
  State<StatefulWidget> createState() => _DepartmentBooksState();
}

class _DepartmentBooksState extends State<DepartmentBooks> {
  @override
  void initState() {
    super.initState();
    getBooksBYDepartment();
  }

  void getBooksBYDepartment() async {
    context
        .read<DepartmentBooksViewmodel>()
        .getBooksByDepartment(context, widget.departmentId!);
  }

  @override
  Widget build(BuildContext context) {
    //var id = ModalRoute.of(context).settings!.arguments;
    //getBooksBYDepartment();
    var viewmodel = Provider.of<DepartmentBooksViewmodel>(context);
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        appBar: CustomAppBAr(
          title: widget.departmentName!,
          icon: Icon(
            Icons.ac_unit,
            color: AppColors.white,
          ),
        ),
        body: SafeArea(
          child: viewmodel.isLoading
              ? ProgressBar(viewmodel.isLoading)
              : Column(
                  children: [
                    viewmodel.lenght == 0
                        ? Noresource(
                            image: 'assets/nobooks3.png',
                            errorMessage: 'No Books Available',
                          )
                        : Expanded(
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: (orientation ==
                                                Orientation.portrait)
                                            ? 2
                                            : 3,
                                        //mainAxisSpacing: 5,
                                        crossAxisSpacing: 2),
                                itemCount: viewmodel
                                    .lenght,
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                      onTap: () {
                                        int? id = viewmodel
                                            .departmentBooks[index]
                                            .getId!;
                                        String? baseFile = viewmodel
                                            .departmentBooks[index]
                                            .baseFile;
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => BookDetails(
                                                id: id,
                                                baseFile: baseFile!,
                                              ),
                                            ));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Card(
                                            elevation: 1,
                                            color: AppColors.white,
                                            child: Image(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(viewmodel
                                                  .departmentBooks[index]
                                                  .thumbnail??"https://pixabay.com/vectors/student-teenager-book-learning-147783/"),
                                            ),
                                          ),
                                        ),
                                      ));
                                }),
                          ),
                  ],
                ),
        ));
  }
}
