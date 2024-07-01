import 'package:flutter/material.dart';
import 'sign_screen.dart';
import 'main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isChecked = false;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/back.png',
              fit: BoxFit.cover,
            ),
          ),
          // Foreground content
          Center(
            child: SingleChildScrollView(
              // To avoid overflow on small screens
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 60), // To add some top margin
                  Container(
                    padding: EdgeInsets.all(20), // Padding inside the white box
                    margin: EdgeInsets.symmetric(
                        horizontal: 30), // Margin to control white box width
                    decoration: BoxDecoration(
                      color: Colors.white, // White background for the box
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26, // Shadow color
                          blurRadius: 10, // Shadow blur radius
                          offset: Offset(0, 4), // Shadow offset
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Image.asset('assets/images/logo.png'), // Logo image
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            labelText: '이메일을 입력하세요',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: '비밀번호를 입력하세요',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: _isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isChecked = value!;
                                    });
                                  },
                                  shape: CircleBorder(), // Circular shape
                                  checkColor:
                                      Colors.white, // Color of the check mark
                                  activeColor:
                                      Colors.black, // Fill color when checked
                                ),
                                Text('로그인 유지'),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                '임시비밀번호발급',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFFB700), // Button color
                            minimumSize:
                                Size(double.infinity, 50), // Button size
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8), // Rounded button corners
                            ),
                          ),
                          child: Text(
                            '로그인',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignScreen()),
                            );
                          },
                          child: Text(
                            '계정이 없으신가요? 회원가입',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.7)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
