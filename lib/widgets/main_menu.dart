import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../controller/affiliation_controller.dart';
import '../controller/chart_number_controller.dart';
import '../controller/selected_patient_controller.dart';
import '../screens/settings_screen.dart';
import '../screens_main/archive_screen.dart';
import '../screens_main/bedding_screen.dart';
import '../screens_main/home_screen.dart';
import '../screens_main/main_examination_screen.dart';
import '../screens_main/medicines_screen.dart';
import '../screens_main/pre_examination_screen.dart';
import '../models/menu_items.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_desktop_app/models/user.dart';
import '../styles/textStyles.dart';
import 'dropdown_button_widget.dart';
import 'package:get/get.dart';
import '../repository/chart_crud_sql.dart';

class MainMenu extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final User user; // 유저 정보를 받을 변수
  final Function(int) onMenuSelected; // 메뉴 선택 시 호출할 콜백 함수

  const MainMenu({
    Key? key,
    required this.navigatorKey,
    required this.user,
    required this.onMenuSelected,
  }) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int selectedMenuIndex = 0; // 홈 메뉴를 기본으로 선택
  int chartNumber = 0;
  late SelectedPatientController selectedPatientController;
  late ChartNumberController chartNumberController;
  late AffiliationController affiliationController;
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    selectedPatientController =
        Get.find<SelectedPatientController>(); // SelectedPatientController 초기화
    chartNumberController =
        Get.find<ChartNumberController>(); // SelectedPatientController 초기화
    // patientNumber의 변경을 감지하여 navigateToScreen 실행
    ever(selectedPatientController.patientNumber, (_) {
      navigateToScreen(
          selectedMenuIndex, selectedPatientController.patientNumber.value);
    });
    affiliationController = Get.find<AffiliationController>();

    // 초기에 현재 시간을 가져와서 설정
    _currentTime = DateTime.now();
    // 1초마다 화면을 업데이트하는 타이머 설정
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (mounted) {
        // 화면이 소멸되면 타이머를 중단하기 위해 체크
        setState(() {
          _currentTime = DateTime.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 1500,
      height: 45,
      decoration: const BoxDecoration(color: Color(0xFFE2F1F6)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              width: 119,
              height: 32.23,
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFF3EA7C2)),
                  borderRadius: BorderRadius.circular(38),
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/icon_dingdong_small.svg'),
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            affiliationController.currentAffiliation.value,
                            style: const TextStyle(
                              color: Color(0xFF3EA7C2),
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 0.12,
                              letterSpacing: 0.12,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10), // 간격 조정
          ...List.generate(menuItems.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedMenuIndex = index;
                });
                // 콜백 함수에서 index를 전달합니다.
                widget.onMenuSelected(index);
                // 콜백 함수에서 index와 환자 번호를 함께 전달합니다.
                navigateToScreen(
                  index,
                  selectedPatientController.patientNumber.value,
                );
              },
              child: buildMenuItem(index),
            );
          }),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              '${widget.user.name}님',
                style: TextStyles.text12Style
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              DateFormat('yyyy-MM-dd').format(_currentTime),
              style: const TextStyle(
                color: Color(0xFF404855),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 0.12,
                letterSpacing: 0.12,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              DateFormat('HH:mm:ss').format(_currentTime),
              style: const TextStyle(
                color: Color(0xFF404855),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 0.12,
                letterSpacing: 0.12,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
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
              },
              child: SvgPicture.asset('assets/icons/icon_settings.svg'),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SvgPicture.asset('assets/icons/icon_message.svg'),
          ),
        ],
      ),
    );
  }

  // 메뉴 아이템 위젯
  Widget buildMenuItem(int index) {
    return SizedBox(
      width: 100, // 각 메뉴의 가로 크기를 100으로 지정
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: [
            if (index == selectedMenuIndex)
              Container(
                width: 4,
                height: 14,
                decoration: const BoxDecoration(color: Color(0xFF3EA7C2)),
              ),
            const SizedBox(width: 8.0),
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
            const SizedBox(width: 4.0),
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

  void navigateToScreen(int index, int patientNumber) {
    switch (index) {
      case 0: // 홈 메뉴
        widget.navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(
            builder: (context) =>
                HomeScreen(user: widget.user), // 홈 스크린으로 이동하면서 유저 정보 전달
          ),
        );
        break;
      case 1:
        widget.navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(
            builder: (context) => PreExaminationScreen(
                patientNumber: patientNumber,
                chartNumber: chartNumberController.chartNumber.value),
          ),
        );
        break;
      case 2:
        widget.navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(
            builder: (context) => MainExaminationScreen(
                patientNumber: patientNumber,
                chartNumber: chartNumberController.chartNumber.value),
          ),
        );
        break;
      case 3:
        widget.navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(
            builder: (context) => BeddingScreen(chartNumber: chartNumberController.chartNumber.value, patientNumber: patientNumber),
          ),
        );
        break;
      case 4:
        widget.navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(
            builder: (context) => MedicinesScreen(),
          ),
        );
        break;
      case 5:
        widget.navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(
            builder: (context) => ArchiveScreen(),
          ),
        );
        break;
    }
  }
}
