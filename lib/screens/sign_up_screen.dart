import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; // Import path package

class SignUpScreen extends StatelessWidget {
  // 변수 선언
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                controller: nameController,
                decoration: InputDecoration(
                  labelText: '이름',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: '이메일',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: userIdController,
                decoration: InputDecoration(
                  labelText: '아이디',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '비밀번호',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
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
                      await saveUserDataToDatabase(
                        context,
                        nameController.text,
                        emailController.text,
                        userIdController.text,
                        passwordController.text,
                      );
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

Future<void> saveUserDataToDatabase( //TODO: sql 파일에 합쳐야함
    BuildContext context,
    String name,
    String email,
    String userId,
    String password,
    ) async {
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
          'CREATE TABLE IF NOT EXISTS user (id INTEGER PRIMARY KEY, name TEXT, email TEXT, username TEXT, password TEXT)');
    },
  );

  // User 객체 생성
  Map<String, dynamic> userMap = {
    'userId': userId,
    'name': name,
    'email': email,
    'password': password,
  };

  // User 정보를 데이터베이스에 삽입
  try {
    int result = await database.insert('user', userMap);
    if (result != -1) {
      // 가입 성공
      Navigator.of(context).pop(); // 다이얼로그 닫기
    } else {
      // 가입 실패
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('회원 가입에 실패했습니다.'),
        ),
      );
    }
  } catch (e) {
    print('Error inserting user: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('회원 가입에 실패했습니다.'),
      ),
    );
    Navigator.of(context).pop();
  }
}


