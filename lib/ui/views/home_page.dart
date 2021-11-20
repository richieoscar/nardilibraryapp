import 'package:flutter/material.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/Books.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/ui/views/all_departments.dart';
import 'package:nardilibraryapp/ui/views/all_featured_releases.dart';
import 'package:nardilibraryapp/viewmodels/homepage_viemodel.dart';
import 'package:nardilibraryapp/widgets/custom_home_section.dart';
import 'package:nardilibraryapp/widgets/progressar.dart';
import 'package:nardilibraryapp/widgets/show_department_section.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/homeapage";
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _categoryDropDownValue = "Novel";

  @override
  void initState() {
    super.initState();

    context.read<HomePageViewmodel>().getDepartments();
    context.read<HomePageViewmodel>().getFeaturedBooks();
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
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  _categoryDropDown(bookCategories, _categoryDropDownValue),
                  search(),
                ],
              ),
              
              const SizedBox(
                height: 25,
              ),
              // context.watch<HomePageViewmodel>().isLoading
              //     ? ProgressBar(context.watch<HomePageViewmodel>().isLoading)
              //     : 
                  HomeSection(
                      sectionTitle: "Featured Releases",
                      books: context.watch<HomePageViewmodel>().homeBooks,
                      seeMore:_seeAllFeaturedReleases),
              const SizedBox(
                height: 25,
              ),
              // context.watch<HomePageViewmodel>().isLoading
              //     ? ProgressBar(context.watch<HomePageViewmodel>().isLoading)
              //     : 
                  DepartmentSection(
                      sectionTitle: "Popular Books",
                      departments:
                          context.watch<HomePageViewmodel>().popularDepartment!,
                      seeMore:_seeAllDepartments),
            ],
          ),
        ),
      ),
    );
  }

  void _seeAllDepartments() {
    context.read<HomePageViewmodel>().navigate(AllDepartments.route, context);
  }
  void _seeAllFeaturedReleases(){
     context.read<HomePageViewmodel>().navigate(AllFeaturedRelease.route, context);

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
        padding: const EdgeInsets.only(right: 20),
        child: Container(
          width: 250,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.mediumLightGrey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Icon(Icons.search_rounded, color: AppColors.searcIconColor),
            ],
          ),
        ),
      ),
    );
  }
}
