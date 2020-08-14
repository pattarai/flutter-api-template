import 'dart:async';

import 'package:mermobile/utils/network_util.dart';

class DateTimeRestDataSource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "https://www.xyz.com";
  static final API_URL = BASE_URL + "/xyz.php";

  Future<dynamic> getServerClock() {
    return _netUtil.post(API_URL).then((dynamic res) {
      print(res.toString());
      print(res.runtimeType);
      return res;
    });
  }
}
