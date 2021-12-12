class Unit {
  String? _name;
  int? _departmentId;

  Unit(this._name, this._departmentId);

  Unit.fromJson(Map<String, dynamic> json) {
    _name = json['Name'];
    _departmentId = json['DepartmentID'];
    
  }
}
