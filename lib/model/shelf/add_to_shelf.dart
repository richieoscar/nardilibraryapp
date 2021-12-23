class AddToShelf {
  int? _resourceId;
  String? _username;
  get getResourceId => _resourceId;

 set setResourceId(int? resourceId) => _resourceId = resourceId;

  get getUsername => _username;

 set setUsername( username) => _username = username;

  AddToShelf(this._resourceId, this._username);

}
