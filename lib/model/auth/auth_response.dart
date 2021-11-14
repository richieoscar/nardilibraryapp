class AuthResponse {
  String? _status;
  String? _message;
  String? _data;

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
    _data = json["data"];
  }

}
