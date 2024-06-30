import 'package:flutter/material.dart';
import 'package:speedat_flutter/meals/breakfast_screen.dart';
import 'package:speedat_flutter/meals/lunch_screen.dart';
import 'package:speedat_flutter/meals/dinner_screen.dart';
import 'package:speedat_flutter/schedule/mon_screen.dart';

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
                  MaterialPageRoute(builder: (context) => LunchScreen()),
                );
              },
              child: const Text(
                '점심밥',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DinnerScreen()),
                );
              },
              child: const Text(
                '저녁밥',
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
                '월요일 시간표',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
