import 'package:queue_management_op/widget/constant.dart';

class Api {
  // static String ip = '10.168.87.175';
  // static String port = '8000';
  static String app = 'queue_management';

  static String getChkNum(String chkOpen) =>
      'http://$ip:$port/$app/default/get_chk?chk_open=$chkOpen';
  static String updateChkNum(int id, String status) =>
      'http://$ip:$port/$app/default/update_chk?id=$id&status=$status';
}

// for online apply
// class Api {
//   // static String ip = '10.168.87.175';
//   // static String port = '8000';
//   static String address = 'https://my.transcombd.com/queue_management';
//   static String app = 'queue_management';

//   static String getChkNum(String chkOpen) =>
//       '$address/default/get_chk?chk_open=$chkOpen';
//   static String updateChkNum(int id, String status) =>
//       '$address/default/update_chk?id=$id&status=$status';
// }
