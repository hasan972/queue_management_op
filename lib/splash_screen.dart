
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:queue_management_op/home_page.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int selectedIndex = 0;
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSplashScreen(
          duration: 2000,
          splash: Image.asset('assets/images/Transcom.png'),
          nextScreen:  HomePage(),
              
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
    );
  }
}
