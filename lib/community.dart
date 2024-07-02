import 'package:flutter/material.dart';
import 'community/community_best.dart';

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
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
    }
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 회색 구분선 (AppBar 아래에 추가)
              Container(
                height: 1,
                color: Colors.grey[300],
              ),
              Container(
                width: double.infinity, // 이미지가 화면 너비에 맞게
                child: Image.asset(
                  'assets/images/comlable.png',
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
              const SizedBox(height: 20), // 이미지 아래 여백 추가
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Icon(Icons.edit, color: Color.fromARGB(255, 253, 176, 10), size: 30),
                    const SizedBox(width: 8),
                    Text(
                      '당신만의 글을 작성해보세요!',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 16), // Text와 TextField 사이의 간격
                    Expanded( // 텍스트 필드가 남은 공간을 차지하도록
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

  LogoWidget({required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      color: Colors.black,
      onPressed: () {
        // 아이콘 버튼을 눌렀을 때의 동작을 여기에 추가할 수 있습니다.
      },
    );
  }
}

class TabButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onPressed;

  TabButton({required this.title, required this.isSelected, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? Color.fromARGB(255, 253, 176, 10): Colors.transparent,
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
