// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserInfo {
  int? _id;
  String? _userName;
  String? _password;
  String? _address;
  String? _commencementYear;
  String? _department;
  String? _designation;
  String? _dob;
  String? _email;
  String? _firstName;
  String? _folio;
  String? _gender;
  String? _institution;
  String? _otherNames;
  String? _phone;
  int? _role;
  String? _state;
  String? _surname;
  bool? _profiled;
  get profiled => _profiled;

 set profiled( value) => _profiled = value;

  get id => _id;

  get userName => _userName;

  set username(String? value) => _userName = value;

  get password => _password;

  set password(value) => _password = value;

  get address => _address;

  set address(value) => _address = value;

  get commencementYear => _commencementYear;

  set commencementYear(value) => _commencementYear = value;

  get department => _department;

  set department(value) => _department = value;

  get designation => _designation;

  set designation(value) => _designation = value;

  get dob => _dob;

  set dob(value) => _dob = value;

  get email => _email;

  set email(value) => _email = value;

  get firstName => _firstName;

  set firstName(value) => _firstName = value;

  get folio => _folio;

  set folio(value) => _folio = value;

  get gender => _gender;

  set gender(value) => _gender = value;

  get institution => _institution;

  set institution(value) => _institution = value;

  get otherNames => _otherNames;

  set otherNames(value) => _otherNames = value;

  get phone => _phone;

  set phone(value) => _phone = value;

  get role => _role;

  set role(value) => _role = value;

  get state => _state;

  set state(value) => _state = value;

  get surname => _surname;

  set surname(value) => _surname = value;

  UserInfo(
      this._userName,
      this._password,
      this._address,
      this._commencementYear,
      this._department,
      this._designation,
      this._dob,
      this._email,
      this._firstName,
      this._folio,
      this._gender,
      this._institution,
      this._otherNames,
      this._phone,
      this._role,
      this._state,
      this._surname);

  UserInfo.withId(
    this._id,
    this._surname,
    this._firstName,
    this._otherNames,
    this._dob,
    this._designation,
    this._gender,
    this._address,
    this._email,
    this._folio,
    this._commencementYear,
    this._department,
    this._phone,
    this._state,
    this._institution,
    this._role,
    this._userName,
    this._password,
    this._profiled,
  );

  UserInfo.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _surname = json['surname'];
    _firstName = json['firstname'];
    _otherNames = json['othernames'];
    _dob = json[dob];
    _designation = json['designation'];
    _gender = json['gender'];
    _address = json['address'];
    _email = json['email'];
    _folio = json['folio'];
    _commencementYear = json['commencementYear'];
    _department = json['department'];
    _phone = json['phone'];
    _state = json['state'];
    _institution = json['institution'];
    _role = json['role'];

    _userName = json['username'];
    _password = json['password'];
    _profiled = json['profiled'];
  }

  @override
  String toString() {
    return 'UserInfo(_id: $_id, _userName: $_userName, _password: $_password, _address: $_address, _commencementYear: $_commencementYear, _department: $_department, _designation: $_designation, _dob: $_dob, _email: $_email, _firstName: $_firstName, _folio: $_folio, _gender: $_gender, _institution: $_institution, _otherNames: $_otherNames, _phone: $_phone, _role: $_role, _state: $_state, _surname: $_surname, _profiled: $_profiled)';
  }
}
