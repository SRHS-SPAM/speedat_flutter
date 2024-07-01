import 'package:flutter/material.dart';
import 'package:speedat_flutter/calendar/calendar.dart';
import 'package:speedat_flutter/main.dart';
import 'package:speedat_flutter/meals/breakfast_screen.dart';
import 'package:speedat_flutter/mypage_screen.dart';
import 'package:speedat_flutter/resetting_screen.dart';
import 'package:speedat_flutter/schedule/mon_screen.dart';
import 'package:speedat_flutter/splash_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SetScreen(),
      routes: {
        '/': (context) => SplashScreen(), // 앱 시작 시 SplashScreen을 표시
        '/home': (context) => HomeScreen(),
        '/bob': (context) => BreakfastScreen(),
        '/cal': (context) => CalScreen(),
        '/mon': (context) => MonScreen(),
        '/my': (context) => MyScreen(),
        '/set': (context) => SetScreen(),
      },
    );
  }
}

class SetScreen extends StatefulWidget {
  @override
  _SetScreenState createState() => _SetScreenState();
}

class _SetScreenState extends State<SetScreen> {
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
              const ListTile(
                leading: Icon(Icons.language),
                title: Text('커뮤니티'),
              ),
              ListTile(
                leading: const Icon(Icons.restaurant_menu),
                title: const Text('급십실'),
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
                    '설정',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResScreen()),
                  );
                },
                child: const Text(
                  '재설정',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
