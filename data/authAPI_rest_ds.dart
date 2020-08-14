import 'dart:async';

import 'package:mermobile/utils/network_util.dart';

class AuthRestDataSource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "https://xstack.azurewebsites.net";
  static final LOGIN_URL = BASE_URL + "/auth-status.php";

  Future<bool> auth(String username, String auth_token) {
    return _netUtil.post(LOGIN_URL, body: {
      "username": username,
      "auth_token": auth_token,
    }).then((dynamic res) {
      print(res.toString());
      print(res.runtimeType);

//      bool resBool = false;
//      switch(res){
//        case "true":
//          resBool = true;
//          break;
//        case "false":
//          resBool = false;
//          break;
//      }
      try {
        if (res["auth_status"] == "true")
          return true;
        else if (res["auth_status"] == "false") return false;
      } catch (e) {
        if (res == "false") return false;
      }
      throw new Exception(
          "Server is under maintenance, please try again later.");
    });
  }
}
