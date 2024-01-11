// import 'package:fluent_ui/fluent_ui.dart';
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

// class MyPage extends StatefulWidget {
//   const MyPage({super.key});

//   @override
//   State<MyPage> createState() => _MyPageState();
// }

// class _MyPageState extends State<MyPage> {
//   bool checked = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xff53A0DEFF),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Icon(
//                 FluentIcons.add,
//                 color: Colors.white,
//               ),
//               SizedBox(
//                 width: 20,
//               ),
//               Icon(
//                 FluentIcons.add_link,
//                 color: Colors.white,
//               )
//             ],
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           Button(
//             child: const Text('Desktop button'),
//             onPressed: () {
//               debugPrint('button pressed');
//             },
//             style: ButtonStyle(backgroundColor: ButtonState.all(Colors.white)),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           Checkbox(
//             checked: checked,
//             onChanged: (select) {
//               setState(() {
//                 checked = select!;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

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
        title: Text('Chartify Desktop App'),
        backgroundColor: Colors.blue, // 앱바 배경색 변경
        // 로고 이미지가 들어갈 자리
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white, // 전체 배경색 변경
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: idController,
              decoration: InputDecoration(
                hintText: 'ID',
              ),
              onChanged: (value) {
                // ID 입력 값 처리
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
              onChanged: (value) {
                // Password 입력 값 처리
              },
            ),
            SizedBox(height: 20),
            Container(
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
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 200, // 원하는 가로 길이 설정
              child: ElevatedButton(
                onPressed: () {
                  // 회원가입 버튼 클릭 시 처리
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                // "Forgot my ID or Password?" 링크 클릭 시 처리
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                );
              },
              child: Text(
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
        title: Text('Main Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                loggedInID,
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              // Logout 버튼 클릭 시 처리
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyPage()),
              );
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Center(
        child: Text('This is the forgot password page.'),
      ),
    );
  }
}
