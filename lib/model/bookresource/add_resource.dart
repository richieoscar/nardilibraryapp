

import 'dart:io';

class BookResource {
  File? _file;
  String? _name;
  String? _mediaType;
  String? _departmentId;
  String? _published;
  String? _description;
  String? _author;
  
  BookResource(
    this._file,
    this._name,
    this._mediaType,
    this._departmentId,
    this._published,
    this._description,
    this._author,
  );

  
}
