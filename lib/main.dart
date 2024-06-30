import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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

class MealCard extends StatelessWidget {
  final String mealType;
  final String menu;

  MealCard({required this.mealType, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 195,
      margin: const EdgeInsets.only(right: 20.0),
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
              height: 1.5,
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

class CustomTable extends StatelessWidget {
  final int rows;
  final int columns;
  final List<List<String>> initialValues;

  CustomTable(
      {required this.rows, required this.columns, required this.initialValues});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: List.generate(rows, (i) {
        return TableRow(
          children: List.generate(columns, (j) {
            return TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: i == 0
                    ? Center(
                        child: Text(
                          initialValues[i][j],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    : SizedBox(
                        height: 190,
                        child: Text(
                          initialValues[i][j],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
              ),
            );
          }),
        );
      }),
    );
  }
}
