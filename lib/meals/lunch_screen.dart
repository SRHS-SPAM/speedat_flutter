import 'package:flutter/material.dart';
import 'package:speedat_flutter/calendar/calendar.dart';
import 'package:speedat_flutter/coummunty/communty_post_screen.dart';
import 'package:speedat_flutter/main.dart';
import 'package:speedat_flutter/meals/breakfast_screen.dart';
import 'package:speedat_flutter/meals/dinner_screen.dart';
import 'package:speedat_flutter/mypage_screen.dart';
import 'package:speedat_flutter/schedule/mon_screen.dart';
import 'package:speedat_flutter/setting_screen.dart';
import 'package:speedat_flutter/splash_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LunchScreen(),
      routes: {
        '/': (context) => SplashScreen(), // 앱 시작 시 SplashScreen을 표시
        '/home': (context) => HomeScreen(),
        '/bob': (context) => BreakfastScreen(),
        '/cal': (context) => CalScreen(),
        '/mon': (context) => MonScreen(),
        '/my': (context) => MyScreen(),
        '/set': (context) => SetScreen(),
        '/compost': (context) => CompostScreen(),
      },
    );
  }
}

class LunchScreen extends StatefulWidget {
  @override
  _LunchScreenState createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/home'); // 메인 화면으로 이동
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
              const Spacer(),
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
        child: Container(
          color: Colors.white, // Drawer의 전체 배경색을 흰색으로 설정
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 140,
                color: Colors.black12, // 상단 박스의 배경색을 투명으로 설정
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('홈'),
                onTap: () {
                  Navigator.pop(context); // 드로어 닫기
                  Navigator.pushNamed(context, '/home'); // '/main'으로 이동
                },
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text('커뮤니티'),
                onTap: () {
                  Navigator.pop(context); // 드로어 닫기
                  Navigator.pushNamed(context, '/compost'); // '/main'으로 이동
                },
              ),
              Container(
                color: Colors.yellow[100], // '시간표' 항목 배경색을 연한 노란색으로 설정
                child: ListTile(
                  leading: const Icon(Icons.restaurant_menu),
                  title: const Text('급식실'),
                  onTap: () {
                    Navigator.pop(context); // 드로어 닫기
                    Navigator.pushNamed(context, '/bob'); // '/main'으로 이동
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.schedule),
                title: const Text('시간표'),
                onTap: () {
                  Navigator.pop(context); // 드로어 닫기
                  Navigator.pushNamed(context, '/mon'); // '/main'으로 이동
                },
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('달력'),
                onTap: () {
                  Navigator.pop(context); // 드로어 닫기
                  Navigator.pushNamed(context, '/cal'); // '/main'으로 이동
                },
              ),
              const Divider(), // 구분선 추가
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('계정', style: TextStyle(color: Colors.grey)),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('마이페이지'),
                onTap: () {
                  Navigator.pop(context); // 드로어 닫기
                  Navigator.pushNamed(context, '/my'); // '/main'으로 이동
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('설정'),
                onTap: () {
                  Navigator.pop(context); // 드로어 닫기
                  Navigator.pushNamed(context, '/set'); // '/main'으로 이동
                },
              ),
            ],
          ),
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
                            backgroundColor: const Color(0xFFFEF9C3),
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
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              '석식',
                              style: TextStyle(fontSize: 20),
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
