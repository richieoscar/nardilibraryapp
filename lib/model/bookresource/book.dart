class Book {
  int? _id;
  String? _name;
  String? _author;
  String? _published;
  String? _department;
  String? _unit;
  String? _description;
  String? _mediaType;
  String? _uploaded;
  String? _thumbnail;
  String? _fileName;
  int? _pages;
  String? _baseFile;

  Book(
      this._id,
      this._name,
      this._author,
      this._published,
      this._department,
      this._unit,
      this._description,
      this._mediaType,
      this._uploaded,
      this._thumbnail,
      this._fileName,
      this._pages,
      this._baseFile);

  int? get getId => _id;

  set setId(int? id) => _id = id;

  get name => _name;

  set name(value) => _name = value;

  get author => _author;

  set author(value) => _author = value;

  get published => _published;

  set published(value) => _published = value;

  get department => _department;

  set department(value) => _department = value;

  get unit => _unit;

  set unit(value) => _unit = value;

  get description => _description;

  set description(value) => _description = value;

  get mediaType => _mediaType;

  set mediaType(value) => _mediaType = value;

  get uploaded => _uploaded;

  set uploaded(value) => _uploaded = value;

  get thumbnail => _thumbnail;

  set thumbnail(value) => _thumbnail = value;

  get fileName => _fileName;

  set fileName(value) => _fileName = value;

  get pages => _pages;

  set pages(value) => _pages = value;

  get baseFile => _baseFile;

  set basefile(String? value) => _baseFile = value;

  Book.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    _name = json["name"];
    _author = json["author"];
    _published = json["published"];
    _department = json["department"];
    _unit = json["unit"];
    _description = json["description"];
    _mediaType = json["mediaType"];
    _uploaded = json["uploaded"];
    _thumbnail = json["thumbnail"];
    _fileName = json["fileName"];
    _pages = json["pages"];
    _baseFile = json['baseFile'];
  }
}
