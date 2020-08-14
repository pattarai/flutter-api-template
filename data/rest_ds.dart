import 'dart:async';

import 'package:mermobile/models/user.dart';
import 'package:mermobile/utils/network_util.dart';

class RestDataSource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "https://xstack.azurewebsites.net";
  static final LOGIN_URL = BASE_URL + "/login.php";

  Future<User> login(String username, String password) {
    return _netUtil.post(LOGIN_URL, body: {
      "username": username,
      "password": password,
    }).then((dynamic res) {
      print(res.toString());
      print(res.runtimeType);
      if (res == "invalid-password")
        throw new Exception("Please check your credentials.");
      else if (res == "auth-error")
        throw new Exception(
            "Server is under maintenance, please try again later.");
      else if (res["user_type"] == "student")
        throw new Exception(
            "You do not have the privileges to access this content.");
      res["username"] = username;
      return new User.map(res);
    });
  }
}
