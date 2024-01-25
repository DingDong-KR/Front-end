import 'package:flutter/material.dart';
import '../screens/settings_screen.dart';
import '../screens_main/archive_screen.dart';
import '../screens_main/bedding_screen.dart';
import '../screens_main/home_screen.dart';
import '../screens_main/main_examination_screen.dart';
import '../screens_main/medicines_screen.dart';
import '../screens_main/pre_examination_screen.dart';
import 'menu_items.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainMenu extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MainMenu({Key? key, required this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(
            width: 122,
            decoration: BoxDecoration(color: Color(0xFFE2F1F6)),
            child: Column(children: [
              GestureDetector(
                onTap: () {
                  // TODO: 드롭 다운 메뉴 구현
                },
                child: SizedBox(
                  height: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        SizedBox(width: 8.0),
                        Text(
                          menuItems.first.title,
                          style: TextStyle(
                            color: Color(0xFF404855),
                            fontSize: menuItems.first.fontSize,
                            fontFamily: 'Pretendard',
                            fontWeight: menuItems.first.fontWeight,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              for (var i = 1; i < menuItems.length; i++)
                GestureDetector(
                  onTap: () {
                    // Navigate to the corresponding screen
                    switch (i) {
                      case 1:
                        navigatorKey.currentState?.pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                        break;
                      case 2:
                        navigatorKey.currentState?.pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => PreExaminationScreen(),
                          ),
                        );
                        break;
                      case 3:
                        navigatorKey.currentState?.pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => MainExaminationScreen(),
                          ),
                        );
                        break;
                      case 4:
                        navigatorKey.currentState?.pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => BeddingScreen(),
                          ),
                        );
                        break;
                      case 5:
                        navigatorKey.currentState?.pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => MedicinesScreen(),
                          ),
                        );
                        break;
                      case 6:
                        navigatorKey.currentState?.pushReplacement(
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
                              title: Text("Settings"),
                              content: SettingsScreen(),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Close"),
                                ),
                              ],
                            );
                          },
                        );
                        break;
                    }
                  },
                  child: SizedBox(
                    height: 50.0, // 각 메뉴간의 간격 //TODO: 피그마와 실제 값 다른 거 체크
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 6.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: SvgPicture.asset(
                                menuItems[i].iconPath,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            menuItems[i].title,
                            style: TextStyle(
                              color: Color(0xFF404855),
                              fontSize: menuItems[i].fontSize,
                              fontFamily: 'Pretendard',
                              fontWeight: menuItems[i].fontWeight,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ]),
          ),
        )
      ],
    );
  }
}
