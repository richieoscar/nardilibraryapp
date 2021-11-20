class Department {
  int? _id;
  String? _name;


  get name => _name!;
  get id => _id!;

  Department(this._id, this._name);

  Department.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    _name = json["name"];
  }
}
