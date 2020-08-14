class User {
  String _username;
  String _auth_token;
  String _full_name;
  String _department;
  String _picture_url;
  int _isClassAdvisor;
  int _isManagement;
  String _user_type;

  User(
      this._username,
      this._auth_token,
      this._full_name,
      this._department,
      this._picture_url,
      this._isClassAdvisor,
      this._isManagement,
      this._user_type);

  User.map(dynamic obj) {
    this._username = obj["username"];
    this._auth_token = obj["auth_token"];
    this._full_name = obj["full_name"];
    this._department = obj["department"];
    this._picture_url = obj["picture_url"];
    this._isClassAdvisor = int.parse(obj["isClassAdvisor"]);
    this._isManagement = int.parse(obj["isManagement"]);
    this._user_type = obj["user_type"];
  }

  String get username => _username;

  String get auth_token => _auth_token;

  String get full_name => _full_name;

  String get department => _department;

  String get picture_url => _picture_url;

  String get user_type => _user_type;

  bool get isClassAdvisor => _isClassAdvisor == 1 ? true : false;

  bool get isManagement => _isManagement == 1 ? true : false;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["auth_token"] = _auth_token;
    map["full_name"] = _full_name;
    switch (_department) {
      case "dit":
        _department = "Information Technology";
        break;
      case "dcse":
        _department = "Computer Science and Engineering";
        break;
      case "dme":
        _department = "Mechanical Engineering";
        break;
      case "dmea":
        _department = "Mechanical Engineering A";
        break;
      case "dmeb":
        _department = "Mechanical Engineering B";
        break;
      case "deee":
        _department = "Electrical and Electronics Engineering";
        break;
      case "dece":
        _department = "Electronics and Communication Engineering";
        break;
      case "dsh":
        _department = "Science and Humanities";
        break;
      case "mgmt":
        _department = "Management";
        break;
      default:
        _department = "Unknown";
        break;
    }
    map["department"] = _department;
    map["picture_url"] = _picture_url;
    map["isClassAdvisor"] = _isClassAdvisor;
    map["isManagement"] = _isManagement;
    map["user_type"] = _user_type;

    return map;
  }
}
