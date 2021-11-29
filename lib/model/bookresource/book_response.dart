import 'package:nardilibraryapp/model/bookresource/book.dart';

class BookResourceResponse {
  String? _status;
  String? _message;
  Book? _book;
  get getStatus => _status!;

  set setStatus(status) => status = status;

  get getMessage => _message!;

  set setMessage(message) => _message = message;

  get getBook => _book!;

  set setBook(book) => _book = book;

  BookResourceResponse(this._status, this._message, this._book);

  BookResourceResponse.fromJson(Map<String, dynamic> json) {
    _status = json["status"];
    _message = json["message"];
    if (json["data"] != null) {
      _book = Book.fromJson(json['data']);
    }
  }
}
