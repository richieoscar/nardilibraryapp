import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nardilibraryapp/model/bookresource/book.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/ui/views/add_resource.dart';
import 'package:nardilibraryapp/ui/views/details_screen.dart';
import 'package:nardilibraryapp/util/utils.dart';
import 'package:nardilibraryapp/viewmodels/search_result_viewmodel.dart';
import 'package:nardilibraryapp/widgets/custom_app_bar.dart';
import 'package:nardilibraryapp/widgets/no_resource.dart';
import 'package:nardilibraryapp/widgets/progressar.dart';
import 'package:provider/provider.dart';

class SearchResult extends StatefulWidget {
  String? searchQuery;
  SearchResult({this.searchQuery});

  @override
  State<StatefulWidget> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  void initState() {
    findResource();
    super.initState();
  }

  void findResource() async {
    context
        .read<SearchResultViewmodel>()
        .findResource(context, widget.searchQuery!);
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    var provider = Provider.of<SearchResultViewmodel>(context);
    return Scaffold(
      appBar: CustomAppBAr(
        title: widget.searchQuery!,
        icon: Icon(
          Icons.ac_unit,
          color: AppColors.white,
        ),
      ),
      body: provider.isLoading
          ? ProgressBar(provider.isLoading)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text("Results (${provider.searchLenght})",
                      style: AppStyle.headline1),
                ),
                provider.searchLenght == 0
                    ? Noresource(
                        image: 'assets/notfound.png',
                        errorMessage: 'No Books Found',
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: provider.searchLenght,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      int id =
                                          provider.searchQueryList[index].getId!;
                                      String? baseFile = provider
                                          .searchQueryList[index].baseFile!;

                                      
                                        AppUtils.openBookDetail(
                                            context: context,
                                            id: id,
                                            baseFile: baseFile);
                                      
                                    },
                                    child: Card(
                                      elevation: 1,
                                      color: AppColors.white,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Image(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(provider
                                                  .searchQueryList[index]
                                                  .thumbnail),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              provider.searchQueryList[index]
                                                      .description ??
                                                  "",
                                              maxLines: 15,
                                              textAlign: TextAlign.justify,
                                            ),
                                          )
                                        ],
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

  Widget noResult() {
    return Center(child: Text("No Result Found"));
  }

  void _print(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddResource()));
  }
}
