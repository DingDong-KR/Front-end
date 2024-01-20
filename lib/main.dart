import 'package:flutter/material.dart';
import 'package:my_desktop_app/screens/login_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Desktop App',
      home: LoginScreen(),
    );
  }
}
