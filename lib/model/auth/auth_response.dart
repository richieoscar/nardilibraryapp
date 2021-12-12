import 'package:nardilibraryapp/model/auth/auth_data.dart';

class AuthResponse {
  String? _status;
  String? _message;
  AuthData? _data;

  String get status => _status!;

  set status(String value) => _status = value;

  get message => _message!;

  set message(value) => _message = value;

  get data => _data!;

  set data(value) => _data = value;

  AuthResponse(this._status, this._message, this._data);

  AuthResponse.fromJson(Map<String, dynamic> json) {
    _status = json["status"];
    _message = json["message"];
    if (json["data"] != null) {
      _data = AuthData.fromJson(json["data"]);
    }
  }
}
