import 'package:flutter/material.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/Books.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/ui/views/all_departments.dart';
import 'package:nardilibraryapp/ui/views/all_featured_releases.dart';
import 'package:nardilibraryapp/ui/views/search_result.dart';
import 'package:nardilibraryapp/util/network_connection.dart';
import 'package:nardilibraryapp/util/utils.dart';
import 'package:nardilibraryapp/viewmodels/homepage_viemodel.dart';
import 'package:nardilibraryapp/widgets/custom_home_section.dart';
import 'package:nardilibraryapp/widgets/progressar.dart';
import 'package:nardilibraryapp/widgets/show_department_section.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  bool? _isConnected;

  @override
  void dispose() {
    super.dispose();
    _searchCOntroller.dispose();
  }

  @override
  void initState() {
    super.initState();
    checkConnectivity();
  }

  void checkConnectivity() async {
    await NetworkConection.initializeConnection();
    bool status = NetworkConection.checkNetworkConnection();
    setState(() {
      _isConnected = status;
    });
    if (!status) {
      AppUtils.showSnackBarforNetwork(context, "No Network Connection");
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    var viewmodel = Provider.of<HomePageViewmodel>(context);
     print(viewmodel.role);
    return Scaffold(
      body: viewmodel.isLoading
          ? ProgressBar(viewmodel.isLoading)
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
                       
                        viewmodel.role == ADMIN
                            ? "Hello Admin,"
                            : "Hello, ${viewmodel.username}",
                        style: AppStyle.blackBoldText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Welcome Back!",
                        style: AppStyle.mediumText,
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
                      seeMore: _seeAllFeaturedReleases,
                      isConnected: _isConnected,
                    ),
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

  void _performSearchQuery(String searchQuery) {
    String query = searchQuery;
    query.isEmpty
        ? AppUtils.showSnackBar(context, "Search field empty")
        : Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchResult(
                searchQuery: query,
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
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    _performSearchQuery(value);
                  },
                  cursorColor: AppColors.backgroundColor,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        _performSearchQuery(_searchCOntroller.text);
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
