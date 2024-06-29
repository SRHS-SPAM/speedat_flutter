import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                Container(
                  color: Colors.transparent,
                ),
                Positioned(
                  top: 16,
                  right: 0,
                  child: Row(
                    children: [
                      LogoWidget(icon: Icons.person),
                      LogoWidget(icon: Icons.nightlight_outlined),
                      LogoWidget(icon: Icons.menu),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  final IconData icon; // 아이콘 데이터를 받는 변수 추가

  LogoWidget({required this.icon}); // 생성자에서 아이콘 데이터를 받도록 수정

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 28,
        height: 28,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x1E000000),
              blurRadius: 2,
              offset: Offset(0, 0),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x28000000),
              blurRadius: 4,
              offset: Offset(0, 2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Icon(icon), // icon 변수를 사용하여 아이콘 표시
      ),
    );
  }
}
