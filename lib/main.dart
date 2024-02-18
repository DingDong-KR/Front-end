import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_desktop_app/controller/chart_number_controller.dart';
import 'package:my_desktop_app/controller/submit_button_controller.dart';
import 'package:my_desktop_app/controller/affiliation_controller.dart';
import 'package:my_desktop_app/controller/selected_patient_controller.dart'; // SelectedPatientController import 추가
import 'package:my_desktop_app/repository/chart_sql_db.dart';
import 'package:my_desktop_app/screens/login_screen.dart';
import 'package:my_desktop_app/screens/main_screen.dart';
import 'package:provider/provider.dart';

import 'controller/auth_controllder.dart';

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
        Get.put(AffiliationController()); //
        Get.put(SelectedPatientController()); //
        Get.put(SubmitButtonController()); //
        Get.put(ChartNumberController());
        Get.put(AuthController());
      }),
      title: 'DingDong',
      home: const LoginScreen(),
    );
  }
}
