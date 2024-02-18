import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controller/affiliation_controller.dart';
import '../models/user.dart';

class DropdownButtonWidget extends StatelessWidget {
  final User user;
  final AffiliationController affiliationController = Get.put(AffiliationController());

  DropdownButtonWidget({required this.user});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AffiliationController>(
      init: affiliationController,
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
      offset: Offset(-5, 33),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      onSelected: (String? affiliation) {
        affiliationController.changeSelectedAffiliation(affiliation ?? '');
      },
      elevation: 0,
      itemBuilder: (BuildContext context) => items,
      child: GetX<AffiliationController>(
        builder: (_) {
          String text = affiliationController.currentAffiliation.value;
          if (text == null || text.isEmpty) {
            text = '채널 선택하기';
          }
          return Container(
            width: 124,
            height: 32,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFF3EA7C2)),
                borderRadius: BorderRadius.circular(38),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12.0,0,0,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: Color(0xFF3EA7C2),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      height: 0.12,
                      letterSpacing: 0.12,
                    ),
                  ),
                  SizedBox(width: 4,),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: ShapeDecoration(
                      color: Color(0xFFE4F2EF),
                      shape: OvalBorder(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: SvgPicture.asset('assets/icons/icon_menu.svg'),
                    ),
                  ),
                ],
              ),
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
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              userAffiliation['affiliation'],
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
        ),
      );
    }).toList();
  }
}
