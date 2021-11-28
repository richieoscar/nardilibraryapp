import 'package:flutter/material.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/Books.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/ui/views/all_departments.dart';
import 'package:nardilibraryapp/ui/views/all_featured_releases.dart';
import 'package:nardilibraryapp/ui/views/search_result.dart';
import 'package:nardilibraryapp/viewmodels/homepage_viemodel.dart';
import 'package:nardilibraryapp/widgets/custom_home_section.dart';
import 'package:nardilibraryapp/widgets/progressar.dart';
import 'package:nardilibraryapp/widgets/show_department_section.dart';
import 'package:provider/provider.dart';

import 'department_book.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/homeapage";
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _categoryDropDownValue = "Novel";

  final TextEditingController _searchCOntroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchCOntroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<HomePageViewmodel>().isLoading
          ? ProgressBar(context.watch<HomePageViewmodel>().isLoading)
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        "Hello, ${context.read<HomePageViewmodel>().getUsername()!}",
                        style: AppStyle.userNameText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Welcome Back!",
                        style: AppStyle.blackBoldText,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        //_categoryDropDown(bookCategories, _categoryDropDownValue),
                        search(),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    HomeSection(
                        sectionTitle: "Featured Releases",
                        books: context.watch<HomePageViewmodel>().homeBooks,
                        seeMore: _seeAllFeaturedReleases),
                    const SizedBox(
                      height: 25,
                    ),
                    DepartmentSection(
                      sectionTitle: "Departments",
                      departments:
                          context.watch<HomePageViewmodel>().popularDepartment!,
                      seeMore: _seeAllDepartments,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void _seeAllDepartments() {
    context.read<HomePageViewmodel>().navigate(AllDepartments.route, context);
  }

  void _seeAllFeaturedReleases() {
    context
        .read<HomePageViewmodel>()
        .navigate(AllFeaturedRelease.route, context);
  }

  Widget _categoryDropDown(List<String> items, String dropDownValue) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.mediumLightGrey),
          child: DropdownButton<String>(
            value: dropDownValue,
            icon: const Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.arrow_drop_down_rounded,
                )),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: AppColors.nardBlack),
            onChanged: (String? newValue) {
              setState(() {
                dropDownValue = newValue!;
              });
            },
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(value),
                ),
              );
            }).toList(),
          )),
    );
  }

  Widget search() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.mediumLightGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchCOntroller,
                  cursorColor: AppColors.backgroundColor,
                
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchResult(
                              searchQuery: _searchCOntroller.text,
                            ),
                          ),
                        );
                      
                      },
                      icon: Icon(Icons.search_rounded,
                          color: AppColors.searcIconColor),
                    ),
                    border: InputBorder.none,

                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    hintText: "Search Books",
                    // label:  Padding(
                    //   padding: EdgeInsets.all(8.0),
                    //   child:  Text("Search Books", style: AppStyle.mediumText,),
                    // ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Expanded(child: Icon(Icons.search_rounded, color: AppColors.searcIconColor)),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
