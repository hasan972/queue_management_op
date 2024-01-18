// import 'package:mysql1/mysql1.dart';

// // class MySQLConnection {
// //   static String host = 'localhost';
// //   static int port = 3306;
// //   static String user = 'root';

// //   static String db = 'einvoice';

// //   Future<MySqlConnection> getConnection() async {
// //     var settings = ConnectionSettings(
// //       host: host,
// //       port: port,
// //       user: user,
// //       db: db,
// //     );

// //     return await MySqlConnection.connect(settings);
// //   }
// // }

// class MysqlService {
//   late Future<MySqlConnection> conn;
//   MysqlService() {
//     conn = openDb();
//   }

//   Future<Results> insertEmploy(String emId, String emName) async {
//     return await conn.then((value) => value.query(
//         'insert into employee (emId, emName, password) values (?, ?, ?)',
//         [emId, emName, '1234']));
//   }

//   Future<List> getEmployee() async {
//     List data = [];
//     await conn.then((value) => value
//             .query('SELECT chk_num FROM `chk_dtl` where chk_open = "F"')
//             .then((results) {
//           for (var row in results) {
//             // Map map = {'chk_num': row[0]};
//             data.add(row[0]);
//           }
//         }));
//     // print(data);
//     return data;
//   }

//   Future updateEmployee(String emId, String emName, int id) async {
//     await conn.then((value) => value.query(
//         "UPDATE employee SET emName = '$emName', emId= '$emId' WHERE id = $id"));
//   }

//   Future deleteEmployee(int id) async {
//     await conn
//         .then((value) => value.query('DELETE FROM employee WHERE id = $id'));
//   }

//   Future<MySqlConnection> openDb() async {
//     var settings = ConnectionSettings(
//       host: '10.0.2.2',
//       port: 3306,
//       user: 'root',
//       // password: '1234',
//       db: 'einvoice',
//     );

//     return await MySqlConnection.connect(settings);
//   }
// }
