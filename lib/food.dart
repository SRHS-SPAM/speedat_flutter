import 'package:flutter/material.dart';
import 'splash_screen.dart'; // splash_screen.dart 파일을 임포트

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(), // 앱 시작 시 SplashScreen을 표시
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // 그림자 제거
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0), // 왼쪽 여백 추가
              child: Image.asset(
                'assets/images/logo.png', // 로고 이미지 경로
                height: 70, // 이미지 높이 설정
                fit: BoxFit.contain, // 이미지 비율 유지
              ),
            ),
            Spacer(), // 남은 공간을 채워서 중앙에 위치하도록 조정
          ],
        ),
        actions: [
          LogoWidget(icon: Icons.person),
          LogoWidget(icon: Icons.nightlight_outlined),
          LogoWidget(icon: Icons.menu),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 회색 구분선 (AppBar 아래에 추가)
              Container(
                height: 1,
                color: Colors.grey[300],
              ),

              // "오늘의 급식" 제목 영역
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

              // 날짜 정보 영역
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 8.0, bottom: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '2024년 6월 29일',
                    style: TextStyle(fontSize: 16, color: Color(0xFF6B7280)),
                  ),
                ),
              ),
              SizedBox(
                height: 360,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  children: [
                    MealCard(
                      mealType: '조식',
                      menu:
                          '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                    ),
                    MealCard(
                      mealType: '중식',
                      menu:
                          '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                    ),
                    MealCard(
                      mealType: '석식',
                      menu:
                          '흰쌀밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(children: [
                      Container(
                        color: const Color(0xFFFEF9C3),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: const Center(
                          child: Text(
                            '조식',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: const Center(
                          child: Text(
                            '중식',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: const Center(
                          child: Text(
                            '석식',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10),
                child: CustomTable(
                  rows: 6,
                  columns: 5,
                  initialValues: const [
                    ['월', '화', '수', '목', '금'],
                    [
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡'
                    ],
                    [
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡'
                    ],
                    [
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡'
                    ],
                    [
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡'
                    ],
                    [
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡'
                    ],
                    [
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡',
                      '혼합잡곡밥 (5)\n된장찌개 (5.6)\n삼색김가루무침 (5.6)\n닭볶음탕 (5.6.13.15)\n배추김치 (9)\n초코수리취떡'
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 30), // 구분선 아래에 여백 추가
              const Divider(
                color: Color(0xFFD1D5DB),
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  final String mealType;
  final String menu;

  const MealCard({required this.mealType, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mealType,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              menu,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  final IconData icon;

  const LogoWidget({required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () {
        // TODO: IconButton 클릭 시 동작 추가
      },
    );
  }
}

class CustomTable extends StatelessWidget {
  final int rows;
  final int columns;
  final List<List<String>> initialValues;

  CustomTable({
    required this.rows,
    required this.columns,
    required this.initialValues,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: List.generate(rows, (rowIndex) {
        return TableRow(
          children: List.generate(columns, (colIndex) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                initialValues[rowIndex][colIndex],
                style: TextStyle(fontSize: 16),
              ),
            );
          }),
        );
      }),
    );
  }
}
