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
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Stack(
              children: [
                Container(
                  color: Colors.transparent,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 70,
                              child: Image.asset(
                                'assets/images/logo.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Row(
                              children: [
                                LogoWidget(icon: Icons.person),
                                LogoWidget(icon: Icons.nightlight_outlined),
                                LogoWidget(icon: Icons.menu),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1,
                        child: Container(
                          color: Colors.grey[300],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 20.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '오늘의 급식',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '2024년 6월 29일',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      // 급식 정보 표시
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 20.0, right: 20.0),
                        child: MealCard(
                          mealType: '조식',
                          menu:
                              '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  final String mealType;
  final String menu;

  MealCard({required this.mealType, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // 화면 너비에 맞게
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mealType,
            style: const TextStyle(
              color: Color(0xFF1A1A1D),
              fontSize: 24,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            menu,
            style: const TextStyle(
              color: Color(0xFF374151),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
              height: 1.5, // 줄 간격 조정
            ),
          ),
        ],
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  final IconData icon;

  LogoWidget({required this.icon});

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
        child: Icon(icon),
      ),
    );
  }
}
