import 'package:flutter/material.dart';
import 'package:speedat_flutter/calendar/calendar.dart';
import 'package:speedat_flutter/coummunty/community_screen.dart';
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
      home: CompostScreen(),
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/bob': (context) => BreakfastScreen(),
        '/cal': (context) => CalScreen(),
        '/mon': (context) => MonScreen(),
        '/my': (context) => MyScreen(),
        '/set': (context) => SetScreen(),
        'com': (context) => CommunityScreen(),
      },
    );
  }
}

class CompostScreen extends StatefulWidget {
  @override
  _CompostScreenState createState() => _CompostScreenState();
}

class _CompostScreenState extends State<CompostScreen> {
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
              Container(
                color: Colors.yellow[100], // '시간표' 항목 배경색을 연한 노란색으로 설정
                child: ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text('커뮤니티'),
                  onTap: () {
                    Navigator.pop(context); // 드로어 닫기
                    Navigator.pushNamed(context, '/compost'); // '/main'으로 이동
                  },
                ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 회색 구분선 (AppBar 아래에 추가)
              Container(
                height: 2,
                color: Colors.grey[200],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/com'); // community_screen.dart로 이동
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 1.0),
                    child: Text(
                      '이 귀여운 사람은 누굴까?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      radius: 20,
                      child: const Icon(Icons.person, color: Colors.grey),
                    ),
                    const SizedBox(width: 10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '안요한',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '시스템과 게시판\n인기 1위 | 10분 전',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Image.asset(
                'assets/images/cat_05.png', // 업로드한 이미지 경로
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '무척이나 예쁘게 생기심\n\n'
                  '송하영은 대한민국 걸그룹 프로미스나인(fromis_9)의 멤버로, '
                  '메인 보컬을 맡고 있다.\n\n'
                  '1997년 9월 29일 생으로, 2017년 Mnet의 서바이벌 프로그램 '
                  '"아이돌 학교"를 통해 데뷔하였다.\n\n'
                  '다재다능한 그녀는 노래와 춤 모두에서 뛰어난 실력을 자랑하며, '
                  '밝고 사랑스러운 성격으로 팬들에게 많은 사랑을 받고 있다.\n\n'
                  '한편, 송하영은 프로미스나인의 다섯 번째 미니 앨범 "My Little Society"의 '
                  '타이틀 곡 "Feel Good (SECRET CODE)" 활동으로 '
                  '큰 주목을 받았다.\n\n'
                  '그녀의 매력적인 목소리와 완벽한 퍼포먼스는 언제나 팬들의 마음을 사로잡는다.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '댓글',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        CommentWidget(
                          username: '커피빌런',
                          comment: '그래서 누구임?',
                          timestamp: '2024년 05월 23일',
                        ),
                        CommentWidget(
                          username: '안요한',
                          comment: '글 안읽었음?',
                          timestamp: '2024년 05월 23일',
                          isAuthor: true,
                          isReply: true,
                        ),
                        CommentWidget(
                          username: '커피빌런',
                          comment: ' 그래서 누구임?',
                          timestamp: '2024년 05월 23일',
                          isReply: true,
                          mentionedUsername: '안요한',
                        ),
                        CommentWidget(
                          username: '카페인이좋은프론트',
                          comment: '히히',
                          timestamp: '2024년 05월 23일',
                        ),
                        CommentWidget(
                          username: '캡틴잭',
                          comment: '배고프다',
                          timestamp: '2024년 05월 23일',
                        ),
                        CommentWidget(
                          username: '잭스충',
                          comment: '섹스',
                          timestamp: '2024년 05월 23일',
                        ),
                      ],
                    ),
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

class CommentWidget extends StatelessWidget {
  final String username;
  final String comment;
  final String timestamp;
  final bool isAuthor;
  final bool isReply;
  final String? mentionedUsername;

  const CommentWidget({
    Key? key,
    required this.username,
    required this.comment,
    required this.timestamp,
    this.isAuthor = false,
    this.isReply = false,
    this.mentionedUsername,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(left: isReply ? 20.0 : 0.0, top: 8.0, bottom: 8.0),
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: 15,
                child: const Icon(Icons.person, color: Colors.grey, size: 15),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          username,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: isAuthor
                                ? const Color.fromARGB(255, 0, 0, 0)
                                : Colors.black,
                          ),
                        ),
                        if (isAuthor)
                          Container(
                            margin: const EdgeInsets.only(left: 4.0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 2.0),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: const Text(
                              '작성자',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    RichText(
                      text: TextSpan(
                        children: [
                          if (mentionedUsername != null)
                            TextSpan(
                              text: '$mentionedUsername ',
                              style: const TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          TextSpan(
                            text: comment,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      timestamp,
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const LogoWidget({Key? key, required this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: Colors.black),
      onPressed: onTap,
    );
  }
}
