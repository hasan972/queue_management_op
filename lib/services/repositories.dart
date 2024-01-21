import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:queue_management_op/services/provider.dart';

class Repositories {
  Future getChk(
    String chkOpen,
  ) async {
    Map chkNumData = {};
    try {
      http.Response response = await Provider().getChkNumDP(chkOpen);
      chkNumData = json.decode(response.body);
      if (chkNumData['status'] == "Success") {
        // print(chkNumData);
        return chkNumData;
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
    return chkNumData;
  }

  Future updateChk(
    int id,
    String status,
  ) async {
    Map chkNumData = {};
    try {
      http.Response response = await Provider().updateChknumDp(id, status);
      chkNumData = json.decode(response.body);
      // if (chkNumData['status'] == "Success") {
      //   // print(chkNumData);
      //   // return chkNumData;
      // }
    } on Exception catch (e) {
      throw Exception(e);
    }
    // return chkNumData;
  }
}
