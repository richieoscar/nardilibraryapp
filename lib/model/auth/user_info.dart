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
 String? get userName => this._userName;

 set userName(String? value) => this._userName = value;

  get password => this._password;

 set password( value) => this._password = value;

  get address => this._address;

 set address( value) => this._address = value;

  get commencementYear => this._commencementYear;

 set commencementYear( value) => this._commencementYear = value;

  get department => this._department;

 set department( value) => this._department = value;

  get designation => this._designation;

 set designation( value) => this._designation = value;

  get dob => this._dob;

 set dob( value) => this._dob = value;

  get email => this._email;

 set email( value) => this._email = value;

  get firstName => this._firstName;

 set firstName( value) => this._firstName = value;

  get folio => this._folio;

 set folio( value) => this._folio = value;

  get gender => this._gender;

 set gender( value) => this._gender = value;

  get institution => this._institution;

 set institution( value) => this._institution = value;

  get otherNames => this._otherNames;

 set otherNames( value) => this._otherNames = value;

  get phone => this._phone;

 set phone( value) => this._phone = value;

  get role => this._role;

 set role( value) => this._role = value;

  get state => this._state;

 set state( value) => this._state = value;

  get surname => this._surname;

 set surname( value) => this._surname = value;

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
