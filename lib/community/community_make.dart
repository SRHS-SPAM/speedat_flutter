import 'package:flutter/material.dart';
import 'package:speedat_flutter/community/community.dart';
import 'package:speedat_flutter/community/community_best.dart';
import 'package:speedat_flutter/community/community_bord.dart';

class CommunityMake extends StatefulWidget {
  @override
  _CommunityBestState createState() => _CommunityBestState();
}

class _CommunityBestState extends State<CommunityMake> {
  String selectedTab = '설계과';
  String selectedCategory = '설계과';
  int currentPage = 1;
  int totalPages = 10;

  TextEditingController titleController = TextEditingController(); // Controller for the title input
  TextEditingController contentController = TextEditingController(); // Controller for the content input

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

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
              Padding(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '글 작성',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButton<String>(
                      value: selectedCategory,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCategory = newValue!;
                        });
                      },
                      isExpanded: true,
                      items: <String>[
                        '게시판 선택',
                        '설계과',
                        '제어과',
                        '시스템과',
                        '군특성화'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: '글 제목',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Handle text button click action
                            print('링크 추가 Button Clicked');
                          },
                          icon: Icon(Icons.link),
                          tooltip: '링크 추가',
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          onPressed: () {
                            // Handle image upload button click action
                            print('이미지 업로드 Button Clicked');
                          },
                          icon: Icon(Icons.upload_rounded),
                          tooltip: '이미지 업로드',
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 300, // Adjust the height as needed
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: contentController,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: '글 내용을 입력해주세요',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Handle submit button click action
                        print('Submit Button Clicked');
                        print('제목: ${titleController.text}');
                        print('내용: ${contentController.text}');
                      },
                      child: Text('등록'),
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
          backgroundColor:
              isSelected ? Color.fromARGB(255, 253, 176, 10) : Colors.transparent,
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

  const CommunityCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.time,
      required this.views,
      required this.likes,
      required this.imageAsset})
      : super(key: key);

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
