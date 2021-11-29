import 'package:flutter/material.dart';
import 'package:nardilibraryapp/model/bookresource/book.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
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
    return Scaffold(
      appBar: CustomAppBAr(
        title: widget.searchQuery!,
        icon: Icon(
          Icons.ac_unit,
          color: AppColors.white,
        ),
      ),
      body: context.watch<SearchResultViewmodel>().isLoading
          ? ProgressBar(context.watch<SearchResultViewmodel>().isLoading)
          : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text("Results (${ context.read<SearchResultViewmodel>().searchLenght})", 
                  
                  style: AppStyle.headline1),
                ),
                context.read<SearchResultViewmodel>().searchLenght == 0
                    ? Noresource(image: 'assets/notfound.png', errorMessage: 'No Books Found',)
                    : Expanded(
                        child:  ListView.builder(
                   
                    itemCount: context.read<SearchResultViewmodel>().searchLenght,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            // Navigator.pushNamed(
                            //   context,
                            //   DepartmentBooks.route,
                            // );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle,
                              ),
                              child: Card(
                                elevation: 1,
                                color: AppColors.white,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Image(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(context
                                            .watch<SearchResultViewmodel>()
                                            .searchQueryList[index]
                                            .thumbnail),
                                      ),
                                    ),
                                      SizedBox(width: 10,),
                                    Expanded(
                                      child: Text(context.watch<SearchResultViewmodel>()
                                            .searchQueryList[index]
                                            .description ?? "",
                                            maxLines: 15,
                                            textAlign: TextAlign.justify,
                                        
                                            ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                    }),
                      ),
              ],
            ),
    );
  }

  Widget noResult() {
    return Center(child: Text("No Result Found"));
  }
}
