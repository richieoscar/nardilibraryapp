import 'package:nardilibraryapp/model/bookresource/department_response.dart';
import 'package:nardilibraryapp/model/bookresource/search_request.dart';
import 'package:nardilibraryapp/model/bookresource/resource_response.dart';
import 'package:nardilibraryapp/model/bookresource/department.dart';
import 'package:nardilibraryapp/model/bookresource/add_resource.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_service.dart';
import 'package:nardilibraryapp/service/wep_api/web_api.dart';
import 'package:nardilibraryapp/service/wep_api/web_api_impl.dart';

class BookResourceImpl extends BookResourceService {
  BookResourceImpl._internal();
  static final BookResourceImpl _instance = BookResourceImpl._internal();
  static get instance => _instance;

  final WebApi _webApi = WebApiImpl.instance;

  @override
  void addAResource(BookResource resource) {
    // TODO: implement addAResource
  }

  @override
  Future<ResourceResponse?> getBookResourceById(int id) {
    // TODO: implement getBookResourceById
    throw UnimplementedError();
  }

  @override
  Future<ResourceResponse?> getBooksByDepartment(int id) async {
     ResourceResponse? resourceResponse = await _webApi.getBooksByDepartment(id);
    return resourceResponse!;
  }

  @override
  Future<DepartmentResponse> getDepartments() async {
    DepartmentResponse? departmentResponse = await _webApi.getDepartments();
    return departmentResponse!;
  }

  @override
  Future<ResourceResponse?> getFeaturedBooks() async {
    ResourceResponse? resourceResponse = await _webApi.getFeaturedBooks();
    return resourceResponse!;
  }

  @override
  Future<ResourceResponse?> searchResources(SearchRequest request) {
    // TODO: implement searchResources
    throw UnimplementedError();
  }
}
