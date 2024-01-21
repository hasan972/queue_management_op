class Api {
  static String ip = '10.168.86.105';
  static String port = '8000';
  static String app = 'queue_management';

  static String getChkNum(String chkOpen) =>
      'http://$ip:$port/$app/default/get_chk?chk_open=$chkOpen';
  static String updateChkNum(int id, String status) =>
      'http://$ip:$port/$app/default/update_chk?id=$id&status=$status';
}
