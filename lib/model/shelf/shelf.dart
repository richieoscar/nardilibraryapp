import 'package:nardilibraryapp/model/bookresource/add_resource.dart';

class Shelf {
  int? _resourceId;
  String? _username;

  get username => _username;
  get resourceId => _resourceId;

  Shelf(this._resourceId, this._username);

  Shelf.fromJson(Map<String, dynamic> json) {
    _resourceId = json['resourceID'];
    _username = json['username'];
  }

  Shelf.fromJsonList(Map<String, dynamic> json) {
    _resourceId = json['resourceID'];
    _username = json['username'];
  }
}
