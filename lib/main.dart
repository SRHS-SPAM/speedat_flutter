import 'package:flutter/material.dart';
import 'package:speedat_flutter/meals/breakfast_screen.dart';
import 'package:speedat_flutter/schedule/mon_screen.dart';
import 'package:speedat_flutter/calendar/calendar.dart';
import 'package:speedat_flutter/mypage_screen.dart';
import 'package:speedat_flutter/setting_screen.dart';
import 'package:speedat_flutter/resetting_screen.dart';
import 'package:speedat_flutter/login_screen.dart'; // Ensure this import exists and points to the correct file

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Speedat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BreakfastScreen()),
                );
              },
              child: const Text(
                '아침밥',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MonScreen()),
                );
              },
              child: const Text(
                '시간표',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalScreen()),
                );
              },
              child: const Text(
                '달력표',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyScreen()),
                );
              },
              child: const Text(
                '마이페이지',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SetScreen()),
                );
              },
              child: const Text(
                '설정',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResScreen()),
                );
              },
              child: const Text(
                '재설정',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: const Text(
                '로그인',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
