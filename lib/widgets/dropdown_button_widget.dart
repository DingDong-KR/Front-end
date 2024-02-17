import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controller/dropdown_button_controller.dart';
import '../models/user.dart';

class DropdownButtonWidget extends StatelessWidget {
  final User user;
  final DropdownButtonController controller = Get.put(DropdownButtonController());

  DropdownButtonWidget({required this.user});

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
              List<PopupMenuEntry<String>> items = (snapshot.data as List<PopupMenuEntry<String>>?) ?? [];
              return _buildPopupMenuButton(items);
            }
          },
        );
      },
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
      child: GetX<DropdownButtonController>(
        builder: (_) {
          String text = controller.currentItem.value;
          if (text == null || text.isEmpty) {
            text = '채널 선택하기';
          }
          return Container(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.right,
                ),
                SizedBox(width: 5),
                SvgPicture.asset('assets/icons/icon_down_arrow.svg')
              ],
            ),
          );
        },
      ),
    );
  }

  Future<List<PopupMenuEntry<String>>> _getUserAffiliationEntries() async {
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