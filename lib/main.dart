import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Container(
              width: 28,
              height: 28,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                shadows: [
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
              child: Image.asset('assets/images/Vector.png'), // 이미지 파일 경로 설정
            ),
          ),
        ),
      ),
    );
  }
}
