import 'package:flutter/material.dart';
import 'package:kfc_queue_management_op/login_page.dart';
import 'package:kfc_queue_management_op/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QUEUE_OP',
      home: SplashPage(),
      // home: LoginPage(),
    );
  }
}
