import 'package:flutter/cupertino.dart';
import 'package:nardilibraryapp/model/bookresource/add_resource.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_impl.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_service.dart';
import 'package:nardilibraryapp/util/utils.dart';

class AddResourceViewmodel extends ChangeNotifier {
  final BookResourceService _bookResourceService = BookResourceImpl.instance;
  bool isLoading = false;
  
  void addResource(BookResource resource, BuildContext context) async {
    isLoading = true;
    notifyListeners();
    bool isSuccessful = await _bookResourceService.addAResource(resource);
    if (isSuccessful) {
        print(resource); 
      AppUtils.showSnackBar(context, "Upload Successful");
      isLoading = false;
      notifyListeners();
    }
  }
}
