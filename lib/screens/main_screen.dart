import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/main_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MainMenu(),
      ]
    );
  }
}