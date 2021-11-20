
import 'package:nardilibraryapp/model/bookresource/department.dart';

class DepartmentResponse {
  String? _status;
  String? _message;
  List<Department>? _data;

  
  get department => _data!;

  set department(value) => _data = value;


  String get status => _status!;

  set status(String value) => _status = value;

  get message => _message!;

  set message(value) => _message = value;

 DepartmentResponse(
    this._status,
    this._message,
    this._data,
  );

  DepartmentResponse.fromJson(Map<String, dynamic> json) {
    _status = json["status"];
    _message = json["message"];
    if (json['data'] != null) {
      _data = List.from(json['data']).map<Department>((e) => Department.fromJson(e)).toList();
    }
  }

 
}
