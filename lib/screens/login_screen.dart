import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_desktop_app/screens/forgot_id_screen.dart';
import 'package:my_desktop_app/screens/forgot_password_screen.dart';
import 'package:my_desktop_app/screens/main_screen.dart';
import 'package:my_desktop_app/screens/sign_up_screen.dart';
import 'package:sqflite/sqflite.dart'; // Import sqflite package
import '../models/user.dart'; // Import user model

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late Database _database; // Database instance

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  // Initialize database
  Future<void> _initDatabase() async {
    _database = await openDatabase(
      'chart.db',
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, password TEXT)',
        );
      },
    );
  }

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<bool> _handleLogin(String username, String password) async {
    // Query the database to check if user exists
    List<Map<String, dynamic>> users = await _database.rawQuery(
      'SELECT * FROM users WHERE username = ? AND password = ?',
      [username, password],
    );

    return users.isNotEmpty; // Return true if user exists, false otherwise
  }

  void _showLoginFailedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Login Failed'),
        content: const Text('Invalid username or password. Please try again.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _login() async {
    String username = idController.text;
    String password = passwordController.text;

    bool isAuthenticated = await _handleLogin(username, password);
    if (isAuthenticated) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
      );
    } else {
      _showLoginFailedDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/image_dingdong.svg'),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 372,
                      height: 40,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF3FA7C3)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: TextFormField(
                        controller: idController,
                        onChanged: (value) {
                          // Password input handling
                        },
                        decoration: InputDecoration(
                          hintText: 'ID를 입력하세요.',
                          hintStyle: TextStyle(
                            color: Color(0xFFD3D3D3),
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: 372,
                      height: 40,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF3FA7C3)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        onChanged: (value) {
                          // Password input handling
                        },
                        decoration: InputDecoration(
                          hintText: '비밀번호를 입력하세요.',
                          hintStyle: TextStyle(
                            color: Color(0xFFD3D3D3),
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: true, // Change the value as needed
                  onChanged: (bool? value) {
                    // Handle checkbox change
                  },
                  fillColor: MaterialStateProperty.resolveWith<Color?>((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Color(0xFF3FA7C3); // Color when selected
                    }
                    return Colors.transparent; // Color when not selected
                  }),
                  checkColor: Colors.white, // Color of the checkmark
                ),
                Text(
                  '자동 로그인',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 13,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0.19,
                    letterSpacing: -0.26,
                  ),
                ),
                SizedBox(width: 45),
                Checkbox(
                  value: true, // Change the value as needed
                  onChanged: (bool? value) {
                    // Handle checkbox change
                  },
                  fillColor: MaterialStateProperty.resolveWith<Color?>((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Color(0xFF3FA7C3); // Color when selected
                    }
                    return Colors.transparent; // Color when not selected
                  }),
                  checkColor: Colors.white, // Color of the checkmark
                ),
                Text(
                  '아이디 저장',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 13,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0.19,
                    letterSpacing: -0.26,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 373,
              height: 40,
              child: ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3FA7C3),
                ),
                child: const Text(
                  '로그인',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '계정을 잊으셨나요? ',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 12,
                    fontFamily: 'Noto Sans KR',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.24,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ForgotIdScreen()),
                    );
                  },
                  child: Text(
                    'ID',
                    style: TextStyle(
                      color: Color(0xFF3FA7C3),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.24,
                    ),
                  ),
                ),
                Text(
                  ' 또는 ',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 12,
                    fontFamily: 'Noto Sans KR',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.24,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                    );
                  },
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '비밀 번호',
                          style: TextStyle(
                            color: Color(0xFF3FA7C3),
                            fontSize: 12,
                            fontFamily: 'Noto Sans KR',
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  ' 찾기 ',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 12,
                    fontFamily: 'Noto Sans KR',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.24,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '아직 회원이 아니신가요? ',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 12,
                    fontFamily: 'Noto Sans KR',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.24,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: Text(
                    '회원가입 >',
                    style: TextStyle(
                      color: Color(0xFF3FA7C3),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.24,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
