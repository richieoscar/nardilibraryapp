class AuthData {
  String? _role;
  String? _token;
  get role => _role;

 set role( value) => _role = value;

  get token => _token;

 set token( value) => _token = value;

  AuthData(this._role, this._token);

  AuthData.fromJson(Map<String, dynamic> json) {
    _role = json['role'];
    _token = json['token'];
  }
}
