import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_desktop_app/screens/forgot_id_screen.dart';
import 'package:my_desktop_app/screens/forgot_password_screen.dart';
import 'package:my_desktop_app/screens/main_screen.dart';
import 'package:my_desktop_app/screens/sign_up_screen.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart'; // Import sqflite package
import 'package:my_desktop_app/models/user.dart'; // Import user model

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Transform.scale(
            scale:1,
            child: Transform.translate(
                offset: Offset(-100,-100),
                child:SvgPicture.asset('assets/images/image_background_circle.svg')),
          ),
          Column(
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
                    fillColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
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
                    fillColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
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
                  onPressed: () async {
                    // 회원 가입 정보를 데이터베이스에 저장
                    await _handleLogin(
                      context,
                      idController.text,
                      passwordController.text,
                    );
                  },
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
                        MaterialPageRoute(
                            builder: (context) => const ForgotIdScreen()),
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
                        MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen()),
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
          Transform.scale(
            scale:0.8,
            child: Transform.translate(
                offset: Offset(1050,250),
                child:SvgPicture.asset('assets/images/image_background_dingdong_1.svg')),
          ),
          Transform.scale(
            scale:1,
            child: Transform.translate(
                offset: Offset(970,680),
                child:SvgPicture.asset('assets/images/image_background_dingdong_2.svg')),
          ),
        ],
      ),
    );
  }
}

void _showLoginFailedDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Login Failed'),
      content: const Text('Invalid Id or password. Please try again.'),
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

Future<void> _handleLogin(
    BuildContext context, String userId, String password) async {
  // 데이터베이스 경로 설정
  String databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'chart.db');

  // 데이터베이스 열기
  Database database = await openDatabase(
    path,
    version: 1,
    onCreate: (Database db, int version) async {
      // 데이터베이스가 존재하지 않는 경우 테이블 생성
      await db.execute(
        'CREATE TABLE IF NOT EXISTS user (userId INTEGER PRIMARY KEY, name TEXT, email TEXT, name TEXT, password TEXT, affiliation TEXT)',
      );
    },
  );

  // Query the database to check if user exists
  List<Map<String, dynamic>> user = await database.rawQuery(
    'SELECT * FROM user WHERE userId = ? AND password = ?',
    [userId, password],
  );

  // 사용자 인증 확인
  bool isAuthenticated = user.isNotEmpty;

  if (isAuthenticated) {
    // 로그인 성공 시 MainScreen으로 이동(유저 정보와 함께)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainScreen(user: User.fromMap(user.first)),
      ),
    );
  } else {
    // 로그인 실패 시 경고 다이얼로그 표시
    _showLoginFailedDialog(context);
  }
}
