

import 'dart:io';

class BookResource {
  String? _file;
  String? _name;
  String? _mediaType;
  String? _departmentId;
  String? _published;
  String? _description;
  String? _author;

  get file => _file!;

 set setfile(String? value) => _file = value;

  get name => _name;

 set name( value) => _name = value;

  get mediaType => _mediaType;

 set mediaType( value) => _mediaType = value;

  get departmentId => _departmentId;

 set departmentId( value) => _departmentId = value;

  get published => _published;

 set published( value) => _published = value;

  get description => _description;

 set description( value) => _description = value;

  get author => _author;

 set author( value) => _author = value;
  
  BookResource(
    this._file,
    this._name,
    this._mediaType,
    this._departmentId,
    this._published,
    this._description,
    this._author,
  );

  @override
  String toString() {
    
    return super.toString();
  }



  
}
