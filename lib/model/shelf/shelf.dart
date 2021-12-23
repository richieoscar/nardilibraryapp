import 'package:nardilibraryapp/model/bookresource/add_resource.dart';

class Shelf {
  String? _status;
  String? _username;

  Shelf(this._status, this._username);

  Shelf.fromJson(Map<String, dynamic> json) {
    _status = json['resourceID'];
    _username = json['username'];
  }

  Shelf.fromJsonList(Map<String, dynamic> json) {
    _status = json['resourceID'];
    _username = json['username'];
  }
}
