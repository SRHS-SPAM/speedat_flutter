import 'package:flutter/material.dart';
import 'package:speedat_flutter/meals/breakfast_screen.dart';
import 'package:speedat_flutter/meals/lunch_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DinnerScreen(),
    );
  }
}

class DinnerScreen extends StatefulWidget {
  @override
  _DinnerScreenState createState() => _DinnerScreenState();
}

class _DinnerScreenState extends State<DinnerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/'); // 메인 화면으로 이동
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Image.asset(
                  'assets/images/logo.png', // 로고 이미지 경로
                  height: 70,
                  fit: BoxFit.contain,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        actions: [
          LogoWidget(icon: Icons.person),
          LogoWidget(icon: Icons.nightlight_outlined),
          Builder(
            builder: (context) => LogoWidget(
              icon: Icons.menu,
              onTap: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text('홈'),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('커뮤니티'),
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              title: Text('시간표'),
            ),
            ListTile(
              leading: Icon(Icons.restaurant_menu),
              title: Text('급식표'),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('달력'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('마이페이지'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('설정'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 회색 구분선 (AppBar 아래에 추가)
              Container(
                height: 2,
                color: Colors.grey[200],
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
                padding: EdgeInsets.only(left: 20.0, top: 8.0, bottom: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '2024년 5월 23일',
                    style: TextStyle(fontSize: 16, color: Color(0xFF6B7280)),
                  ),
                ),
              ),
              SizedBox(
                height: 320,
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
                    TableRow(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BreakfastScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              '조식',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LunchScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              '중식',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DinnerScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            backgroundColor: const Color(0xFFFEF9C3),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              '석식',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
  final VoidCallback? onTap;

  LogoWidget({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
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
