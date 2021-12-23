import 'package:nardilibraryapp/model/auth/auth_data.dart';
import 'package:nardilibraryapp/model/bookresource/add_resource.dart';
import 'package:nardilibraryapp/model/bookresource/book.dart';
import 'package:nardilibraryapp/model/shelf/shelf.dart';

class ShelfResponse {
  String? _status;
  String? _message;
  Shelf? _data;
  List<Book>? _shelvedBooks;

  String get status => _status!;

  set status(String value) => _status = value;

  get message => _message!;

  set message(value) => _message = value;

  get data => _data!;

  set data(value) => _data = value;

  get shelVedBooks => _shelvedBooks!;

  ShelfResponse(this._status, this._message, this._data);

  ShelfResponse.fromJson(Map<String, dynamic> json) {
    _status = json["status"];
    _message = json["message"];
    if (json["data"] != null) {
      _data = Shelf.fromJson(json["data"]);
    }
  }

  ShelfResponse.fromJsonList(Map<String, dynamic> json) {
    _status = json["status"];
    _message = json["message"];
    if (json["data"] != null) {
      _shelvedBooks  = List.from(json['data']).map<Book>((e) => Book.fromJson(e)).toList();
    }
  }
}
