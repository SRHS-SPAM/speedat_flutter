import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speedat_flutter/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // 3초 후에 홈 화면으로 이동하는 Timer 설정
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 이전에는 Scaffold를 사용했지만, 이번에는 Scaffold 없이 진행합니다.
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        color: Colors.white,
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            height: 200.0,
            width: 200.0,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
