import 'package:flutter/material.dart';
import 'package:queue_management_op/splash_screen.dart';



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
    );
  }
}
