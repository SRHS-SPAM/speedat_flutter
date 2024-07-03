import 'package:flutter/material.dart';
import 'package:speedat_flutter/calendar/calendar.dart';
import 'package:speedat_flutter/coummunty/community_best.dart';
import 'package:speedat_flutter/coummunty/community_bord.dart';
import 'package:speedat_flutter/main.dart';
import 'package:speedat_flutter/meals/breakfast_screen.dart';
import 'package:speedat_flutter/schedule/mon_screen.dart';
import 'package:speedat_flutter/setting_screen.dart';
import 'package:speedat_flutter/mypage_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 라우트 설정 추가
      routes: {
        '/home': (context) => HomeScreen(),
        '/Compost': (context) => CommunityScreen(),
        '/bob': (context) => BreakfastScreen(),
        '/mon': (context) => MonScreen(),
        '/cal': (context) => CalScreen(),
        '/my': (context) => MyScreen(),
        '/set': (context) => SetScreen(),
      },
      home: CommunityScreen(),
    );
  }
}

class CommunityScreen extends StatefulWidget {
  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  String selectedTab = '커뮤니티 홈';

  void onTabSelected(String title) {
    setState(() {
      selectedTab = title;
    });
    if (title == '인기 글') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CommunityBest()),
      );
    } else if ((title == '시스템과') ||
        (title == '설계과') ||
        (title == '제어과') ||
        (title == '군특성화')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CommunityBord()),
      );
    }
  }

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
                  'assets/images/logo.png',
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
              Container(
                color: Colors.yellow[100],
                child: ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text('커뮤니티'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/Compost');
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.restaurant_menu),
                title: const Text('급십실'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/bob');
                },
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 1,
                color: Colors.grey[300],
              ),
              Container(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/comlabal.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TabButton(
                      title: '커뮤니티 홈',
                      isSelected: selectedTab == '커뮤니티 홈',
                      onPressed: () => onTabSelected('커뮤니티 홈'),
                    ),
                    TabButton(
                      title: '인기 글',
                      isSelected: selectedTab == '인기 글',
                      onPressed: () => onTabSelected('인기 글'),
                    ),
                    TabButton(
                      title: '설계과',
                      isSelected: selectedTab == '설계과',
                      onPressed: () => onTabSelected('설계과'),
                    ),
                    TabButton(
                      title: '제어과',
                      isSelected: selectedTab == '제어과',
                      onPressed: () => onTabSelected('제어과'),
                    ),
                    TabButton(
                      title: '시스템과',
                      isSelected: selectedTab == '시스템과',
                      onPressed: () => onTabSelected('시스템과'),
                    ),
                    TabButton(
                      title: '군특성화',
                      isSelected: selectedTab == '군특성화',
                      onPressed: () => onTabSelected('군특성화'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Icon(Icons.edit,
                        color: Color.fromARGB(255, 253, 176, 10), size: 30),
                    const SizedBox(width: 8),
                    Text(
                      '당신만의 글을 작성해보세요!',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '검색',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '다양한 ',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: '이야기',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 253, 176, 10),
                                  ),
                                ),
                                TextSpan(
                                  text: '가 모이는곳,',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            '여기서 새로운 우정을 쌓아보세요',
                            style: TextStyle(fontSize: 16),
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
              Padding(
                padding: EdgeInsets.only(left: 15, top: 40),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '최신 글',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: 2,
                color: Colors.grey[600],
              ),
              Column(
                children: List.generate(5, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Container(
                      width: 425,
                      height: 110,
                      child: CommunityCard(
                        title: '커뮤니티 글 ${index + 1}',
                        description: '여기는 커뮤니티 글 ${index + 1}에 대한 설명입니다.',
                        time: '${30 - index}분 전',
                        views: '${50 + index}',
                        likes: '${10 - index}',
                        imageAsset: 'assets/images/communty.png',
                      ),
                    ),
                  );
                }),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 40),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '인기 글',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: 2,
                color: Colors.grey[600],
              ),
              Column(
                children: List.generate(5, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Container(
                      width: 425,
                      height: 110,
                      child: CommunityCard(
                        title: '커뮤니티 글 ${index + 1}',
                        description: '여기는 커뮤니티 글 ${index + 1}에 대한 설명입니다.',
                        time: '${30 - index}분 전',
                        views: '${50 + index}',
                        likes: '${10 - index}',
                        imageAsset: 'assets/images/communty.png',
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap; // onTap 속성 추가

  const LogoWidget({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      color: Colors.black,
      onPressed: onTap, // onTap 속성 사용
    );
  }
}

class TabButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onPressed;

  TabButton({
    required this.title,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: isSelected
              ? Color.fromARGB(255, 253, 176, 10)
              : Colors.transparent,
          foregroundColor: Colors.black,
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}

class CommunityCard extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final String views;
  final String likes;
  final String imageAsset;

  const CommunityCard({
    Key? key,
    required this.title,
    required this.description,
    required this.time,
    required this.views,
    required this.likes,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          imageAsset,
          width: 70,
          height: 70,
          fit: BoxFit.cover,
        ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.access_time),
                SizedBox(width: 5),
                Text(time),
                SizedBox(width: 20),
                Icon(Icons.remove_red_eye),
                SizedBox(width: 5),
                Text(views),
                SizedBox(width: 20),
                Icon(Icons.thumb_up),
                SizedBox(width: 5),
                Text(likes),
              ],
            ),
          ],
        ),
        onTap: () {
          // TODO: 글 상세보기 기능 추가
        },
      ),
    );
  }
}
