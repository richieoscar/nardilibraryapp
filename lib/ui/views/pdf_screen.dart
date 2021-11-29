import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/viewmodels/pdf_screen_viewmodel.dart';
import 'package:nardilibraryapp/widgets/custom_app_bar.dart';
import 'package:nardilibraryapp/widgets/custom_button.dart';
import 'package:nardilibraryapp/widgets/goto_page.dart';
import 'package:provider/provider.dart';

class PDFScreen extends StatefulWidget {
  final String? path;

  PDFScreen({this.path});

  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  TextEditingController _pageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBAr(
        title: 'Document',
        icon: Icon(Icons.find_in_page, color: AppColors.pasejicBlack),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Column(
                  children:  [
                    TextField(
                      controller: _pageController,
                    )
                   
          
                   
                  ],
                );
              });
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Page ($currentPage of $pages)",
                    style: AppStyle.mediumText),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                PDFView(
                  filePath: widget.path,
                  enableSwipe: true,
                  swipeHorizontal: true,
                  autoSpacing: false,
                  pageFling: true,
                  pageSnap: true,
                  defaultPage: currentPage!,
                  fitPolicy: FitPolicy.BOTH,
                  preventLinkNavigation:
                      false, // if set to true the link is handled in flutter
                  onRender: (_pages) {
                    setState(() {
                      pages = _pages;
                      isReady = true;
                    });
                  },
                  onError: (error) {
                    setState(() {
                      errorMessage = error.toString();
                    });
                    print(error.toString());
                  },
                  onPageError: (page, error) {
                    setState(() {
                      errorMessage = '$page: ${error.toString()}';
                    });
                    print('$page: ${error.toString()}');
                  },
                  onViewCreated: (PDFViewController pdfViewController) {
                    _controller.complete(pdfViewController);
                  },
                  onLinkHandler: (String? uri) {
                    print('goto uri: $uri');
                  },
                  onPageChanged: (int? page, int? total) {
                    print('page change: $page/$total');
                    setState(() {
                      currentPage = page;
                    });
                  },
                ),
                errorMessage.isEmpty
                    ? !isReady
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container()
                    : Center(
                        child: Text(errorMessage),
                      )
              ],
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Swipe Left or Right",
              style: AppStyle.yelloSmalText,
            ),
          ))
        ],
      ),
      floatingActionButton: FutureBuilder<PDFViewController>(
        future: _controller.future,
        builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
          if (snapshot.hasData) {
            return FloatingActionButton.extended(
              label: Text("Go"),
              onPressed: () async {
                await snapshot.data!.setPage(int.parse(_pageController.text));
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
