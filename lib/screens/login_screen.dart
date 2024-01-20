import 'package:flutter/material.dart';
import 'package:my_desktop_app/screens/forgot_screen.dart';
import 'package:my_desktop_app/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // 컨트롤러 해제
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chartify Desktop App'),
        backgroundColor: Colors.blue, // 앱바 배경색 변경
        // 로고 이미지가 들어갈 자리
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white, // 전체 배경색 변경
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: idController,
              decoration: const InputDecoration(
                hintText: 'ID',
              ),
              onChanged: (value) {
                // ID 입력 값 처리
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
              onChanged: (value) {
                // Password 입력 값 처리
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200, // 원하는 가로 길이 설정
              child: ElevatedButton(
                onPressed: () {
                  // 로그인 버튼 클릭 시 처리
                  String loggedInID = idController.text;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(loggedInID: loggedInID),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200, // 원하는 가로 길이 설정
              child: ElevatedButton(
                onPressed: () {
                  // 회원가입 버튼 클릭 시 처리
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                // "Forgot my ID or Password?" 링크 클릭 시 처리
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ForgotScreen()),
                );
              },
              child: const Text(
                'Forgot my ID or Password?',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
