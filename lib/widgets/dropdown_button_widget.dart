import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controller/dropdown_button_controller.dart';
import '../models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controller/dropdown_button_controller.dart';
import '../models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controller/dropdown_button_controller.dart';
import '../models/user.dart';

class DropdownButtonWidget extends StatelessWidget {
  final User user; // User 정보 변수
  final DropdownButtonController controller =
      Get.put(DropdownButtonController());

  DropdownButtonWidget({required this.user}); // 'user'를 초기화하는 생성자

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DropdownButtonController>(
      init: controller,
      builder: (_) {
        return FutureBuilder<List<PopupMenuEntry<String>>>(
          future: _getUserAffiliationEntries(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('오류: ${snapshot.error}'));
            } else {
              List<PopupMenuEntry<String>> items =
                  (snapshot.data as List<PopupMenuEntry<String>>?) ?? [];
              if (items.isEmpty) {
                // 소속이 없을 경우 드롭다운 버튼만 표시
                return _buildDropdownButton();
              }
              return _buildPopupMenuButton(items);
            }
          },
        );
      },
    );
  }

  Widget _buildDropdownButton() {
    return PopupMenuButton<String>(
      offset: Offset(-80, 35),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      itemBuilder: (BuildContext context) => [],
      child: Obx(
        () => Container(
          padding: EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                controller.currentItem.value ?? '채널을 선택하세요',
                textAlign: TextAlign.right,
              ),
              SizedBox(width: 5),
              SvgPicture.asset('assets/icons/icon_down_arrow.svg')
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopupMenuButton(List<PopupMenuEntry<String>> items) {
    return PopupMenuButton<String>(
      offset: Offset(-80, 35),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onSelected: (String? affiliation) {
        controller.changeDropdownMenu(affiliation ?? '');
      },
      elevation: 0,
      itemBuilder: (BuildContext context) => items,
      child: Obx(
        () => Container(
          padding: EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                controller.currentItem.value ?? '채널을 선택하세요',
                textAlign: TextAlign.right,
              ),
              SizedBox(width: 5),
              SvgPicture.asset('assets/icons/icon_down_arrow.svg')
            ],
          ),
        ),
      ),
    );
  }

  Future<List<PopupMenuEntry<String>>> _getUserAffiliationEntries() async {
    // 해당 유저의 가입 동아리를 찾는 메서드
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'chart.db');

    Database database = await openDatabase(
      path,
      version: 1,
    );

    List<Map<String, dynamic>> userAffiliations = await database.rawQuery(
      'SELECT affiliation FROM userAffiliation WHERE userId = ? ORDER BY affiliation ASC',
      [user.userId.toString()],
    );

    return userAffiliations.map((userAffiliation) {
      return PopupMenuItem<String>(
        value: userAffiliation['affiliation'].toString(),
        height: 30,
        child: Center(
          child: Text(userAffiliation['affiliation']),
        ),
      );
    }).toList();
  }
}