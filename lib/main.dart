import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'splash_screen.dart'; // splash_screen.dart 파일을 임포트
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(), // 앱 시작 시 SplashScreen을 표시
    );
  }
}

class HomeScreen extends StatelessWidget {
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

              // 메인페이지
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '서울로봇고등학교\n커뮤니티 & 웹사이트 앱',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 1),
                          Text(
                            'Speedat',
                            style: TextStyle(
                              color: Color.fromARGB(255, 253, 176, 10),
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  Color.fromARGB(255, 253, 176, 10), // 밑줄 색상 설정
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            '학교 정보를 더 빠르고 간편하게!',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Image.asset(
                      'assets/images/home.png',
                      width: 147,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),

              // 회색 구분선 (마지막 부분에 추가)
              Container(
                height: 1,
                color: Colors.grey[300],
              ),

              //달력 이름
              Padding(
                padding: EdgeInsets.only(left: 15.0, top: 32.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '달력',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // 달력 mealcard
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 425,
                    child: MealCardWithCalendar(
                      mealType: '',
                      menu: '',
                    ),
                  ),
                ],
              ),
              // 새로 추가된 버튼과 일정 카드
              Row(
                children: [
                  // 버튼 카드
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150, // 높이를 동일하게 맞추기 위해 고정 높이 설정
                        child: Card(
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.center, // 내용 중앙 정렬
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.event),
                                title: Text('달력 바로가기'),
                              ),
                              ButtonBar(
                                alignment:
                                    MainAxisAlignment.end, // 버튼을 오른쪽 하단으로 이동
                                children: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      minimumSize: Size(100, 40), // 버튼 크기 설정
                                      backgroundColor: Color.fromARGB(
                                          255, 253, 176, 10), // 버튼 배경색 노란색으로 설정
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                    ),
                                    onPressed: () {
                                      // TODO: 버튼 클릭 시 달력으로 바로가기 동작 추가
                                    },
                                    child: const Text(
                                      '바로가기',
                                      style: TextStyle(
                                          color: Colors.white), // 버튼 텍스트 색상 설정
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // 일정 카드
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150, // 높이를 동일하게 맞추기 위해 고정 높이 설정
                        child: Card(
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.center, // 내용 중앙 정렬
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.calendar_today),
                                title: Text('오늘의 일정'),
                                subtitle: Text('세부 일정 내용'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // 식사 정보 테이블
              Container(
                height: 1,
                color: Colors.grey[300],
              ),

              Padding(
                padding: EdgeInsets.only(left: 15.0, top: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '커뮤니티',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 15.0, top: 2.5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '최신글 부터 인기글 그리고 각 과의 게시물을 살펴보고 공유해보세요!',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // 추가된 카드
              Column(
                children: List.generate(3, (index) {
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
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey;
                        }
                        return Colors.orange;
                      },
                    ),
                    foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.white.withOpacity(0.5);
                        }
                        return Colors.white;
                      },
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(425, 50),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                  ),
                  onPressed: () {
                    // TODO: 커뮤니티 바로가기 기능 구현
                  },
                  child: Text(
                    '커뮤니티 바로가기',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              SizedBox(height: 10),

              // 커뮤니티 바로가기 버튼

              // 회색 구분선
              Container(
                height: 1,
                color: Colors.grey[300],
              ),

              Padding(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '급식',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // 여러 개의 MealCard 예시 (Horizontal Scrolling)
              Container(
                height: 350, // 높이 설정
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    // 각 카드에 대한 제목 설정
                    String mealTitle = index == 0
                        ? '조식'
                        : index == 1
                            ? '중식'
                            : '석식'; // 예시 제목, 실제로 원하는 제목으로 수정 가능

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10.0),
                      child: Container(
                        width: 200, // 너비 설정
                        child: MealCard(
                          mealType: mealTitle, // 수정된 제목 사용
                          menu: '밥, 김치, 불고기', // 동일한 메뉴
                          imageAsset: 'assets/images/first.png', // 이미지 경로 추가
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 20),

              // 회색 구분선
              Container(
                height: 1,
                color: Colors.grey[300],
              ),

              Padding(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '시간표',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 15.0, top: 2.5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '오늘의 시간표와 과목을 확인해보세요!',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // 추가된 카드
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Image.asset(
                            'assets/images/time.png',
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '1교시 : 로봇 디자인',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '다음 교시: 로봇디자인',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 8),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.disabled)) {
                                          return Colors.grey; // 비활성 상태 배경색
                                        }
                                        return Colors.orange; // 활성 상태 배경색
                                      },
                                    ),
                                    foregroundColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.disabled)) {
                                        return Colors.white
                                            .withOpacity(0.5); // 비활성 상태 글자색
                                      }
                                      return Colors.white; // 활성 상태 글자색
                                    }),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                      Size(425, 50), // 버튼 최소 크기 설정
                                    ),
                                    padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(
                                          horizontal: 20.0), // 내부 여백 설정
                                    ),
                                  ),
                                  onPressed: () {
                                    // TODO: 버튼 클릭 시 동작 추가
                                  },
                                  child: Text(
                                    '시간표 바로가기',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 달력 라이브러리 !! 이거없으면 앱 실행 자체가 안됨. 건들지말것
class MealCardWithCalendar extends StatefulWidget {
  final String mealType;
  final String menu;

  const MealCardWithCalendar({required this.mealType, required this.menu});

  @override
  _MealCardWithCalendarState createState() => _MealCardWithCalendarState();
}

class _MealCardWithCalendarState extends State<MealCardWithCalendar> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Container(
        width: 400, // 카드의 너비 설정
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.mealType.isNotEmpty) ...[
              Text(
                widget.mealType,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
            ],
            if (widget.menu.isNotEmpty) ...[
              Text(
                widget.menu,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
            ],
            TableCalendar(
              locale: 'ko_KR', // 한국어로 설정
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                });
              },
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // update `_focusedDay` as well
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

DateFormat(String s) {}

class LogoWidget extends StatelessWidget {
  final IconData icon;

  const LogoWidget({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () {
          // TODO: Add functionality for logo icon buttons if needed
        },
        child: Icon(
          icon,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}

// 커뮤 글 + 아이콘들 + 눌렀을떄 게시물 이동
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

class MealCard extends StatelessWidget {
  final String mealType;
  final String menu;
  final String imageAsset;
  final VoidCallback? onPressed;

  const MealCard({
    required this.mealType,
    required this.menu,
    required this.imageAsset,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageAsset,
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              mealType,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              menu,
              style: TextStyle(fontSize: 14),
            ),
          ),
          Spacer(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 45.0, vertical: 8.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.grey; // 비활성 상태 배경색
                    }
                    return Colors.orange; // 활성 상태 배경색
                  },
                ),
                foregroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.white.withOpacity(0.5); // 비활성 상태 글자색
                  }
                  return Colors.white; // 활성 상태 글자색
                }),
                minimumSize: MaterialStateProperty.all<Size>(
                  Size(425, 50), // 버튼 최소 크기 설정
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(horizontal: 20.0), // 내부 여백 설정
                ),
              ),
              onPressed: () {
                // TODO: 커뮤니티 바로가기 기능 구현
              },
              child: Text(
                '급식 바로가기',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
