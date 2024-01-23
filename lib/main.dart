import 'package:flutter/material.dart';
import 'package:my_desktop_app/screens/login_screen.dart';
import 'package:my_desktop_app/screens/main_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    double screenWidth = 1216;
    double screenHeight = 684;
    print(screenWidth);
    print(screenHeight);
    return MaterialApp(
      title: 'Desktop App',
      home: MainScreen(),
    );
  }
}
