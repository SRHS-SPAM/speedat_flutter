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
      },
    );
  }
}

class SetScreen extends StatefulWidget {
  @override
  _SetScreenState createState() => _SetScreenState();
}

class _SetScreenState extends State<SetScreen> {
  final List<Map<String, dynamic>> posts = List.generate(10, (index) {
    return {
      'title': '송하영은 누굴까요?',
      'description': '프로미스나인의 초 귀염둥이...',
      'image': 'assets/images/cat_05.png',
      'time': '30분 전',
      'views': 56,
      'comments': 12,
      'likes': 999,
    };
  });

  bool _isPasswordVisible = false; // State to manage password visibility

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
              // 삽입된 내용 시작
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 30,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '김스팸님',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '3학년 12반 395번',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons
                              .edit), // Using edit icon from Material Icons
                          onPressed: () {
                            // Add your onPressed code here
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 600, // Adjust the width
                      height: 200, // Adjust the height
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Text(
                          '제 동아리 런천미트 아닙니다. 스팸입니다. \n집 ㅈㄴ 가고싶어요',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const ListTile(
                title: Text('계정'),
              ),
              const Divider(),
              ListTile(
                title: Text('아이디'),
                subtitle: Text('any492266'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Add your onTap code here
                },
              ),
              ListTile(
                title: Text('비밀번호'),
                subtitle:
                    Text(_isPasswordVisible ? 'speedat12!' : '************'),
                trailing: IconButton(
                  icon: Icon(_isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                onTap: () {
                  // Add your onTap code here
                },
              ),
              ListTile(
                title: Text('전화번호'),
                subtitle: Text('010-9704-7620'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Add your onTap code here
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // 회원 탈퇴 버튼 클릭 시 처리할 동작
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  child: const Text('회원 탈퇴'),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      // 삽입된 내용 끝
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
