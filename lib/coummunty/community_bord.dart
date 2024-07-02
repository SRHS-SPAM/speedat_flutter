import 'package:flutter/material.dart';
import 'package:speedat_flutter/coummunty/community_best.dart';
import 'package:speedat_flutter/coummunty/community_screen.dart';

class CommunityBord extends StatefulWidget {
  @override
  _CommunityBestState createState() => _CommunityBestState();
}

class _CommunityBestState extends State<CommunityBord> {
  String selectedTab = '시스템과';
  int currentPage = 1;
  int totalPages = 10;

  void onTabSelected(String title) {
    setState(() {
      selectedTab = title;
    });
    if (title == '커뮤니티 홈') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Community()),
      );
    } else if (title == '시스템과') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CommunityBord()),
      );
    } else if (title == '인기글') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CommunityBest()),
      );
    }
  }

  void onPageChanged(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Image.asset(
                'assets/images/logo.png',
                height: 70,
                fit: BoxFit.contain,
              ),
            ),
            Spacer(),
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
              Container(
                height: 1,
                color: Colors.grey[300],
              ),
              Container(
                width: double.infinity,
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
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '0과 1그리고',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 버그가 가득한',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            '시스템과 게시판',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Image.asset(
                      'assets/images/bord.png',
                      width: 147,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '최신 글',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TabButton(
                      title: '최신 순',
                      isSelected: selectedTab == '최신 순',
                      onPressed: () => onTabSelected('최신 순'),
                    ),
                    TabButton(
                      title: '좋아요 순',
                      isSelected: selectedTab == '좋아요 순',
                      onPressed: () => onTabSelected('좋아요 순'),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey[300],
              ),
              Column(
                children: List.generate(15, (index) {
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
                        likes: '${40 - index}',
                        imageAsset: 'assets/images/communty.png',
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              PaginationWidget(
                currentPage: currentPage,
                totalPages: totalPages,
                onPageChanged: onPageChanged,
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
        // Add functionality here if needed
      },
    );
  }
}

class TabButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onPressed;

  TabButton(
      {required this.title, required this.isSelected, required this.onPressed});

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

class PaginationWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;

  const PaginationWidget({
    Key? key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> pageNumbers = [];

    // Add first and previous buttons
    pageNumbers.add(
      IconButton(
        onPressed: currentPage > 1 ? () => onPageChanged(1) : null,
        icon: Icon(Icons.first_page),
        color: Colors.orange,
      ),
    );
    pageNumbers.add(
      IconButton(
        onPressed:
            currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
        icon: Icon(Icons.chevron_left),
        color: Colors.orange,
      ),
    );

    // Add page number buttons
    for (int i = 1; i <= totalPages; i++) {
      if (i == currentPage ||
          i == 1 ||
          i == totalPages ||
          (i >= currentPage - 1 && i <= currentPage + 1)) {
        pageNumbers.add(
          GestureDetector(
            onTap: () => onPageChanged(i),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: currentPage == i ? Colors.orange : Colors.transparent,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                i.toString(),
                style: TextStyle(
                  color: currentPage == i ? Colors.black : Colors.grey,
                  fontWeight:
                      currentPage == i ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      } else if (i == currentPage - 2 || i == currentPage + 2) {
        pageNumbers.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              '...',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
        );
      }
    }

    // Add next and last buttons
    pageNumbers.add(
      IconButton(
        onPressed: currentPage < totalPages
            ? () => onPageChanged(currentPage + 1)
            : null,
        icon: Icon(Icons.chevron_right),
        color: Colors.orange,
      ),
    );
    pageNumbers.add(
      IconButton(
        onPressed:
            currentPage < totalPages ? () => onPageChanged(totalPages) : null,
        icon: Icon(Icons.last_page),
        color: Colors.orange,
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: pageNumbers,
    );
  }
}
