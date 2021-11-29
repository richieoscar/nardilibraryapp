class UserInfo {
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
  String? _role;
  String? _state;
  String? _surname;

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
}
