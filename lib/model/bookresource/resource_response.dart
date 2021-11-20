import 'package:nardilibraryapp/model/Books.dart';
import 'package:nardilibraryapp/model/bookresource/book.dart';
import 'package:nardilibraryapp/model/bookresource/department.dart';

class ResourceResponse {
  String? _status;
  String? _message;
  List<Book>? _books;
 

  String get status => _status!;

  set status(String value) => _status = value;

  get message => _message!;

  set message(value) => _message = value;

  get books => _books!;

  set data(value) => _books = value;

  ResourceResponse(this._status, this._message, this._books);  

  ResourceResponse.fromJson(Map<String, dynamic> json) {
    _status = json["status"];
    _message = json["message"];
    if (json['data'] != null) {
      _books = List.from(json['data']).map<Book>((e) => Book.fromJson(e)).toList();
    }
  }

  @override
  String toString() =>
      'FeaturedBooks(_status: $_status, _message: $_message, _data: $_books)';
}
