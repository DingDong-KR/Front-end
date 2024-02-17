import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_desktop_app/controller/add_patient_button_controller.dart';
import 'package:my_desktop_app/controller/dropdown_button_controller.dart';
import 'package:my_desktop_app/controller/selected_patient_controller.dart'; // SelectedPatientController import 추가
import 'package:my_desktop_app/repository/chart_sql_db.dart';
import 'package:my_desktop_app/screens/login_screen.dart';
import 'package:my_desktop_app/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  SqlDataBase db = SqlDataBase.instance;
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(DropdownButtonController()); // 드롭다운 메뉴 상태관리를 위한 클래스
        Get.put(SelectedPatientController()); // SelectedPatientController 등록
        Get.put(AddPatientButtonController()); //
      }),
      title: 'DingDong',
      home: const LoginScreen(),
    );
  }
}
