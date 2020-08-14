import 'dart:async';

import 'package:mermobile/utils/network_util.dart';

class ConsolidationFullReportRestDataSource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "https://xstack.azurewebsites.net";
  static final LOGIN_URL = BASE_URL + "/mgmt-class-consolidation.php";

  Future<dynamic> fetch(String username, String auth_token, String start_date,
      String end_date, String department, String year) {
    return _netUtil.post(LOGIN_URL, body: {
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
