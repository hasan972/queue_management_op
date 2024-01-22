import 'package:http/http.dart' as http;
import 'package:queue_management_op/services/apis.dart';

class Provider {
  Future<http.Response> getChkNumDP(
    String chkOpen,
  ) async {
    http.Response response = await http.get(
      Uri.parse(Api.getChkNum(chkOpen)),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  Future<http.Response> updateChknumDp(
    int id,
    String status,
  ) async {
    http.Response response = await http.get(
      Uri.parse(Api.updateChkNum(id, status)),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    return response;
  }
}
