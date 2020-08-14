import 'dart:async';

import 'package:mermobile/utils/network_util.dart';

class ConsolidationFullReportRestDataSource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "https://www.xyz.com";
  static final API_URL = BASE_URL + "/xyz.php";

  Future<dynamic> fetch(String username, String auth_token, String start_date,
      String end_date, String department, String year) {
    return _netUtil.post(API_URL, body: {
      "username": username,
      "auth_token": auth_token,
      "start_date": start_date,
      "end_date": end_date,
      "department": department,
      "year": year,
    }).then((dynamic res) {
      return res;
    });
  }
}
