import 'package:flutter/material.dart';
import 'package:speedat_flutter/main.dart';

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
        '/': (context) => MyHomePage(),
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
                color: Colors.red, // 상단 박스의 배경색을 투명으로 설정
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('홈'),
                onTap: () {
                  Navigator.pop(context); // 드로어 닫기
                  Navigator.pushNamed(context, '/'); // '/main'으로 이동
                },
              ),
              const ListTile(
                leading: Icon(Icons.language),
                title: Text('커뮤니티'),
              ),
              const ListTile(
                leading: Icon(Icons.schedule),
                title: Text('시간표'),
              ),
              const ListTile(
                leading: Icon(Icons.restaurant_menu),
                title: Text('급식표'),
              ),
              const ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('달력'),
              ),
              const ListTile(
                leading: Icon(Icons.person),
                title: Text('마이페이지'),
              ),
              const ListTile(
                leading: Icon(Icons.settings),
                title: Text('설정'),
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
      return Center(child: Text('메모 없음'));
    }
    return ListView(
      shrinkWrap: true,
      children: events
          .map((event) => ListTile(
                title: Text(event.title),
                subtitle: Text(
                    '${event.startTime.format(context)} - ${event.endTime.format(context)}'),
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
            decoration: InputDecoration(
              labelText: '제목',
            ),
          ),
          Row(
            children: [
              Text('메모 입력'),
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
                        startTime: TimeOfDay(hour: 4, minute: 0),
                        endTime: TimeOfDay(hour: 5, minute: 0),
                      );
                      if (selectedEvents[_selectedDay] != null) {
                        selectedEvents[_selectedDay]!.add(event);
                      } else {
                        selectedEvents[_selectedDay] = [event];
                      }
                      _eventController.clear();
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
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  Event({
    required this.title,
    required this.startTime,
    required this.endTime,
  });
}
