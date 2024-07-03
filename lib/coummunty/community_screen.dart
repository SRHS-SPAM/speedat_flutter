import 'package:flutter/material.dart';
import 'package:speedat_flutter/calendar/calendar.dart';
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
      home: CommunityScreen(),
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/bob': (context) => BreakfastScreen(),
        '/cal': (context) => CalScreen(),
        '/mon': (context) => MonScreen(),
        '/my': (context) => MyScreen(),
        '/set': (context) => SetScreen(),
        '/post': (context) => CompostScreen(),
      },
    );
  }
}

class CommunityScreen extends StatefulWidget {
  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final List<Map<String, dynamic>> posts = List.generate(10, (index) {
    return {
      'title': '이 귀여운 사람은 누굴까?',
      'description': '프로미스나인의 초 귀염둥이...',
      'image': 'assets/images/cat_05.png',
      'time': '30분 전',
      'views': 56,
      'comments': 12,
      'likes': 999,
    };
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Image.asset(
                  'assets/images/logo.png', // Updated image path
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
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 140,
                color: Colors.black12,
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('홈'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/home');
                },
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text('커뮤니티'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/post');
                },
              ),
              Container(
                color: Colors.yellow[100],
                child: ListTile(
                  leading: const Icon(Icons.restaurant_menu),
                  title: const Text('급식실'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/bob');
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.schedule),
                title: const Text('시간표'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/mon');
                },
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('달력'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cal');
                },
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('계정', style: TextStyle(color: Colors.grey)),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('마이페이지'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/my');
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('설정'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/set');
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/comlabal.png', // 이미지 경로를 실제 경로로 바꾸세요
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildTopButton(
                                context, '커뮤니티 홈', Colors.yellow, true),
                            _buildTopButton(
                                context, '인기 글', Colors.white, false),
                            _buildTopButton(
                                context, '설계과', Colors.white, false),
                            _buildTopButton(
                                context, '제어과', Colors.white, false),
                            _buildTopButton(
                                context, '시스템과', Colors.white, false),
                            _buildTopButton(
                                context, '군특성화', Colors.white, false),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(
                          hintText: '태그 혹은 제목을 입력해주세요.',
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Navigator.pushNamed(context, '/post');
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onSubmitted: (value) {
                          // handle search action
                        },
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey[300],
                      ),
                      // 메인페이지
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '다양한 이야기가 모이는곳,',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 1),
                                  SizedBox(height: 5),
                                  Text(
                                    '여기서 새로운 친구를 만나고, 다양한 활동을 경험해 보세요',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Image.asset(
                              'assets/images/comhome.png',
                              width: 147,
                              height: 150,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                      // Updated image path
                      const SizedBox(height: 16),
                      Text(
                        '최신 글',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const Divider(color: Colors.grey),
                      for (var post in posts)
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/compost');
                          },
                          child: PostCard(post: post),
                        ),
                      const SizedBox(height: 32),
                      Text(
                        '인기 글',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      for (var post in posts)
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/compost');
                          },
                          child: PostCard(post: post),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopButton(
      BuildContext context, String title, Color color, bool isHome) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton(
        onPressed: () {
          if (isHome) {
            Navigator.pushNamed(context, '/');
          } else if (title == '인기 글') {
            Navigator.pushNamed(context, '/communitybest');
          } else {
            Navigator.pushNamed(context, '/communitybord');
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final Map<String, dynamic> post;

  PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // 이미지 추가
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/cat_05.png', // 이미지 경로를 실제 경로로 바꾸세요
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post['title'],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(post['description']),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(post['time']),
                      Spacer(),
                      Icon(Icons.remove_red_eye, size: 16),
                      SizedBox(width: 4),
                      Text(post['views'].toString()),
                      SizedBox(width: 16),
                      Icon(Icons.thumb_up, size: 16), // 좋아요 아이콘으로 변경
                      SizedBox(width: 4),
                      Text(post['likes'].toString()), // 좋아요 수
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
