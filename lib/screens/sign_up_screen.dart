import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatelessWidget {

  String name = ''; // 이름을 입력하는 TextFormField의 값을 할당

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '회원가입',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 18,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '이름',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // 사용자가 이름을 입력할 때마다 호출되는 콜백
                  name = value; // 변수에 입력된 값을 할당
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '이메일',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '아이디',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '비밀번호',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '소속',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // 다이얼로그 닫기
                    },
                    child: Text('취소'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () async {
                      // 회원 가입 정보를 데이터베이스에 저장
                      await saveUserDataToDatabase(context);
                    },
                    child: Text('가입하기'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> saveUserDataToDatabase(BuildContext context) async {
  String name = ''; // 이름을 입력하는 TextFormField의 값을 할당
  String email = ''; // 이메일을 입력하는 TextFormField의 값을 할당
  String username = ''; // 아이디를 입력하는 TextFormField의 값을 할당
  String password = ''; // 비밀번호를 입력하는 TextFormField의 값을 할당
  String organization = ''; // 소속을 입력하는 TextFormField의 값을 할당

  User user = User(
    name: name,
    email: email,
    username: username,
    password: password,
    organization: organization,
  );

  // DatabaseHelper databaseHelper = DatabaseHelper();
  // int userId = await databaseHelper.insertUser(user.toMap());
  //
  // if (userId != -1) {
  //   // 가입 성공
  //   Navigator.of(context).pop(); // 다이얼로그 닫기
  // } else {
  //   // 가입 실패
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('회원 가입에 실패했습니다.'),
  //     ),
  //   );
  // }
}

class User {
  final String name;
  final String email;
  final String username;
  final String password;
  final String organization;

  User({
    required this.name,
    required this.email,
    required this.username,
    required this.password,
    required this.organization,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'username': username,
      'password': password,
      'organization': organization,
    };
  }
}
