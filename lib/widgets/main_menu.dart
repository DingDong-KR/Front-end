import 'package:flutter/material.dart';
import '../screens/settings_screen.dart';
import '../screens_main/archive_screen.dart';
import '../screens_main/bedding_screen.dart';
import '../screens_main/home_screen.dart';
import '../screens_main/main_examination_screen.dart';
import '../screens_main/medicines_screen.dart';
import '../screens_main/pre_examination_screen.dart';
import '../models/menu_items.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainMenu extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MainMenu({Key? key, required this.navigatorKey}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int selectedMenuIndex = 100;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(
            width: 122,
            decoration: const BoxDecoration(color: Color(0xFFE2F1F6)),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // TODO: 드롭 다운 메뉴 구현
                  },
                  child: Row(
                    children: [
                      buildMenuItem(0),
                      const SizedBox(
                        width: 3,
                      ),
                      SvgPicture.asset(menuItems[0].iconPath),
                    ],
                  ),
                ),
                for (var i = 1; i < menuItems.length; i++)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedMenuIndex = i;
                      });
                      // Navigate to the corresponding screen
                      navigateToScreen(i);
                    },
                    child: buildMenuItem(i),
                  ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // 메뉴 아이템 위젯
  Widget buildMenuItem(int index) {
    return SizedBox(
      height: 50.0,
      child: Padding(
        padding: index != 0
            ? const EdgeInsets.symmetric(horizontal: 16.0)
            : const EdgeInsets.fromLTRB(16.0, 0, 2.0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: [
            if (index != 0 && index == selectedMenuIndex)
              Container(
                width: 4,
                height: 14,
                decoration: const BoxDecoration(color: Color(0xFF3EA7C2)),
              ),
            if (index != 0) SizedBox(width: index == 0 ? 2.0 : 8.0),
            if (index != 0)
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset(
                    menuItems[index].iconPath,
                    color: index == selectedMenuIndex
                        ? const Color(0xFF3EA7C2)
                        : const Color(0xFF404855),
                  ),
                ),
              ),
            if (index != 0) const SizedBox(width: 8.0),
            Text(
              menuItems[index].title,
              style: TextStyle(
                color: index == selectedMenuIndex
                    ? const Color(0xFF3EA7C2)
                    : const Color(0xFF404855),
                fontSize: menuItems[index].fontSize,
                fontFamily: 'Pretendard',
                fontWeight: index == selectedMenuIndex
                    ? FontWeight.w700
                    : menuItems[index].fontWeight,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToScreen(int index) {
    switch (index) {
      case 1:
        widget.navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
        break;
      case 2:
        widget.navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(
            builder: (context) => PreExaminationScreen(),
          ),
        );
        break;
      case 3:
        widget.navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MainExaminationScreen(),
          ),
        );
        break;
      case 4:
        widget.navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(
            builder: (context) => BeddingScreen(),
          ),
        );
        break;
      case 5:
        widget.navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(
            builder: (context) => MedicinesScreen(),
          ),
        );
        break;
      case 6:
        widget.navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(
            builder: (context) => ArchiveScreen(),
          ),
        );
        break;
      case 7:
        // 설정 화면 다이어로그로 띄우기
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Settings"),
              content: SettingsScreen(),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Close"),
                ),
              ],
            );
          },
        );
        break;
    }
  }
}
