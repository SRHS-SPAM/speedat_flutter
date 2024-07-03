import 'package:flutter/material.dart';
import 'package:speedat_flutter/coummunty/communty_post_screen.dart';
import 'package:speedat_flutter/main.dart';
import 'package:speedat_flutter/meals/breakfast_screen.dart';
import 'package:speedat_flutter/mypage_screen.dart';
import 'package:speedat_flutter/schedule/mon_screen.dart';
import 'package:speedat_flutter/setting_screen.dart';
import 'package:speedat_flutter/splash_screen.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalScreen(),
      routes: {
        '/': (context) => SplashScreen(), // 앱 시작 시 SplashScreen을 표시
        '/home': (context) => HomeScreen(),
        '/bob': (context) => BreakfastScreen(),
        '/cal': (context) => CalScreen(),
        '/mon': (context) => MonScreen(),
        '/my': (context) => MyScreen(),
        '/set': (context) => SetScreen(),
        '/compost': (context) => CompostScreen(),
      },
    );
  }
}

class CalScreen extends StatefulWidget {
  @override
  _CalScreenState createState() => _CalScreenState();
}

class _CalScreenState extends State<CalScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  Map<DateTime, List<Event>> selectedEvents = {};
  bool isAddingEvent = false;
  TextEditingController _eventController = TextEditingController();
  TextEditingController _memoController = TextEditingController();
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  Color _selectedColor = Colors.red;

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
          // 마이페이지 이동 로고
          LogoWidget(
            icon: Icons.person,
            onTap: () {
              Navigator.pushNamed(context, '/my'); // '/my'는 마이페이지 라우트 이름입니다.
            },
          ),
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
              Container(
                color: Colors.yellow[100], // '시간표' 항목 배경색을 연한 노란색으로 설정
                child: ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: const Text('달력'),
                  onTap: () {
                    Navigator.pop(context); // 드로어 닫기
                    Navigator.pushNamed(context, '/cal'); // '/main'으로 이동
                  },
                ),
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
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            calendarFormat: _calendarFormat,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                isAddingEvent = false;
              });
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            eventLoader: _getEventsFromDay,
          ),
          const SizedBox(height: 8.0),
          isAddingEvent ? _buildEventForm() : _buildEventList(),
          const SizedBox(height: 8.0),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isAddingEvent = true;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  List<Event> _getEventsFromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  Widget _buildEventList() {
    final events = _getEventsFromDay(_selectedDay);
    if (events.isEmpty) {
      return const Center(child: Text('메모 없음'));
    }
    return ListView(
      shrinkWrap: true,
      children: events
          .map((event) => ListTile(
                title: Text(event.title),
                subtitle: Text(
                    '${event.startTime.format(context)} - ${event.endTime.format(context)}'),
                tileColor: event.color,
              ))
          .toList(),
    );
  }

  Widget _buildEventForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _eventController,
            decoration: const InputDecoration(
              labelText: '제목',
            ),
          ),
          const SizedBox(height: 8.0),
          TextField(
            controller: _memoController,
            decoration: InputDecoration(
              labelText: '메모 입력',
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: '시작 시간',
                  ),
                  onTap: () async {
                    TimeOfDay? time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null) {
                      setState(() {
                        _startTime = time;
                      });
                    }
                  },
                  controller: TextEditingController(
                    text: _startTime != null ? _startTime!.format(context) : '',
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: '종료 시간',
                  ),
                  onTap: () async {
                    TimeOfDay? time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null) {
                      setState(() {
                        _endTime = time;
                      });
                    }
                  },
                  controller: TextEditingController(
                    text: _endTime != null ? _endTime!.format(context) : '',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Text('메모 컬러 변경'),
              SizedBox(width: 8.0),
              DropdownButton<Color>(
                value: _selectedColor,
                onChanged: (Color? newColor) {
                  setState(() {
                    _selectedColor = newColor!;
                  });
                },
                items: <Color>[
                  Colors.red,
                  Colors.orange,
                  Colors.yellow,
                  Colors.green,
                  Colors.blue,
                  Colors.indigo,
                  Colors.purple
                ].map<DropdownMenuItem<Color>>((Color value) {
                  return DropdownMenuItem<Color>(
                    value: value,
                    child: Container(
                      width: 24,
                      height: 24,
                      color: value,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      final event = Event(
                        title: _eventController.text,
                        memo: _memoController.text,
                        startTime: _startTime ?? TimeOfDay(hour: 0, minute: 0),
                        endTime: _endTime ?? TimeOfDay(hour: 0, minute: 0),
                        color: _selectedColor,
                      );
                      if (selectedEvents[_selectedDay] != null) {
                        selectedEvents[_selectedDay]!.add(event);
                      } else {
                        selectedEvents[_selectedDay] = [event];
                      }
                      _eventController.clear();
                      _memoController.clear();
                      _startTime = null;
                      _endTime = null;
                      isAddingEvent = false;
                    });
                  },
                  child: Text('저장'),
                ),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      isAddingEvent = false;
                    });
                  },
                  child: Text('취소'),
                ),
              ),
            ],
          ),
        ],
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

class Event {
  final String title;
  final String memo;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final Color color;

  Event({
    required this.title,
    required this.memo,
    required this.startTime,
    required this.endTime,
    required this.color,
  });
}
