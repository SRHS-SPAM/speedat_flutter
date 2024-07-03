import 'package:flutter/material.dart';
import 'package:speedat_flutter/calendar/calendar.dart';
import 'package:speedat_flutter/coummunty/community_best.dart';
import 'package:speedat_flutter/coummunty/community_bord.dart';
import 'package:speedat_flutter/coummunty/community_screen.dart';
import 'package:speedat_flutter/coummunty/communty_post_screen.dart';
import 'package:speedat_flutter/main.dart';
import 'package:speedat_flutter/meals/breakfast_screen.dart';
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
      home: CummunitypostmakeScreen(),
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/bob': (context) => BreakfastScreen(),
        '/cal': (context) => CalScreen(),
        '/mon': (context) => MonScreen(),
        '/my': (context) => MyScreen(),
        '/set': (context) => SetScreen(),
        '/post': (context) => CompostScreen(),
        '/com': (context) => CommunityScreen(),
        '/communitybest': (context) => CommunitybestScreen(),
        '/communitybord': (context) => CommunitybordScreen(),
        '/communitymake': (context) => CummunitypostmakeScreen(),
      },
    );
  }
}

class CummunitypostmakeScreen extends StatefulWidget {
  @override
  _CummunitypostmakeScreenState createState() =>
      _CummunitypostmakeScreenState();
}

class _CummunitypostmakeScreenState extends State<CummunitypostmakeScreen> {
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
          const LogoWidget(icon: Icons.person),
          const LogoWidget(icon: Icons.nightlight_outlined),
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
                  Navigator.pushNamed(context, '/com'); // '/main'으로 이동
                },
              ),
              ListTile(
                leading: const Icon(Icons.restaurant_menu),
                title: const Text('급식표'),
                onTap: () {
                  Navigator.pop(context); // 드로어 닫기
                  Navigator.pushNamed(context, '/bob'); // '/main'으로 이동
                },
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
              Container(
                color: Colors.yellow[100], // '시간표' 항목 배경색을 연한 노란색으로 설정
                child: ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('설정'),
                  onTap: () {
                    Navigator.pop(context); // 드로어 닫기
                    Navigator.pushNamed(context, '/set'); // '/main'으로 이동
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '글 작성',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              hint: Text('게시판 선택'),
              items: <String>['게시판 1', '게시판 2', '게시판 3'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle change
              },
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: '제목',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.image),
                  onPressed: () {
                    // Handle image selection
                  },
                ),
                IconButton(
                  icon: Icon(Icons.link),
                  onPressed: () {
                    // Handle link addition
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: TextField(
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: '글 내용 작성',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/com');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    minimumSize: Size(150, 20),
                    textStyle: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  child: Text(
                    '취소',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/post');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    minimumSize: Size(150, 20),
                    textStyle: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  child: Text(
                    '등록',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget createCell(String content) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      content,
      style: const TextStyle(fontSize: 16.0),
      textAlign: TextAlign.center,
    ),
  );
}

class LogoWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const LogoWidget({super.key, required this.icon, this.onTap});

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
