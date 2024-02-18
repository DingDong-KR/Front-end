import 'package:flutter/material.dart';
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
import 'dropdown_button_widget.dart';
import 'package:get/get.dart';
import '../repository/chart_crud_sql.dart';

class MainMenu extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final User user; // 유저 정보를 받을 변수

  const MainMenu({Key? key, required this.navigatorKey, required this.user})
      : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int selectedMenuIndex = 100;
  int chartNumber=0;
  late SelectedPatientController selectedPatientController;
  late ChartNumberController chartNumberController;
  late AffiliationController affiliationController;

  @override
  void initState() {
    super.initState();
    selectedPatientController = Get.find<SelectedPatientController>(); // SelectedPatientController 초기화
    chartNumberController = Get.find<ChartNumberController>(); // SelectedPatientController 초기화
    // patientNumber의 변경을 감지하여 navigateToScreen 실행
    ever(selectedPatientController.patientNumber, (_) {
      navigateToScreen(
          selectedMenuIndex, selectedPatientController.patientNumber.value);
    });
    affiliationController = Get.find<AffiliationController>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(
            width: 154,
            decoration: const BoxDecoration(color: Color(0xFFE2F1F6)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: SvgPicture.asset('assets/images/image_dingdong_menu.svg'),
                ),
                for (var i = 1; i < menuItems.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedMenuIndex = i;
                        });
                        // 콜백 함수에서 index와 환자 번호를 함께 전달합니다.
                        navigateToScreen(
                            i, selectedPatientController.patientNumber.value);
                      },
                      child: buildMenuItem(i),
                    ),
                  ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Container(
                      width: 119,
                      height: 32.23,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF3EA7C2)),
                          borderRadius: BorderRadius.circular(38),
                        ),
                      ),
                      child:Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            affiliationController.currentAffiliation.value ??
                                '채널을 선택하세요',
                            style: TextStyle(
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
                  ),
                ),
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

  void navigateToScreen(int index, int patientNumber) {
    switch (index) {
      case 1:
        widget.navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(
            builder: (context) =>
                HomeScreen(user: widget.user), // 홈 스크린으로 이동하면서 유저 정보 전달
          ),
        );
        break;
      case 2:
        widget.navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(
            builder: (context) => PreExaminationScreen(
                patientNumber: patientNumber, chartNumber: chartNumberController.chartNumber.value),
          ),
        );
        break;
      case 3:
        widget.navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(
            builder: (context) =>
                MainExaminationScreen(patientNumber: patientNumber,chartNumber: chartNumberController.chartNumber.value),
          ),
        );
        break;
      case 4:
        widget.navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(
            builder: (context) => BeddingScreen(patientNumber: patientNumber),
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
