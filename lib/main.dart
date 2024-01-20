import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return const FluentApp(
    return const MaterialApp(
      title: 'Desktop App',
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
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
                      builder: (context) => MainPage(loggedInID: loggedInID),
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
                  MaterialPageRoute(
                      builder: (context) => const ForgotPasswordPage()),
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

class MainPage extends StatelessWidget {
  final String loggedInID;

  const MainPage({Key? key, required this.loggedInID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hello ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                loggedInID,
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              // Logout 버튼 클릭 시 처리
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyPage()),
              );
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: const Center(
        child: Text('This is the forgot password page.'),
      ),
    );
  }
}
