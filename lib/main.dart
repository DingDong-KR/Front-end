import 'package:flutter/material.dart';
import 'package:my_desktop_app/screens/login_screen.dart';
import 'package:my_desktop_app/screens/main_screen.dart';
import 'package:get/get.dart';

import 'controller/dropdown_button_controller.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    double screenWidth = 1216;
    double screenHeight = 684;
    return GetMaterialApp(
      initialBinding: BindingsBuilder((){
        Get.put(DropdownButtonController()); // 드롭다운 메뉴 상태관리를 위한 클래스
      }),
      title: 'DingDong',
      home: MainScreen(),
    );
  }
}
