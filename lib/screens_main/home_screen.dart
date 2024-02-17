import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controller/dropdown_button_controller.dart';
import 'package:my_desktop_app/models/user.dart';

import '../screens/add_affiliation_screen.dart';

class HomeScreen extends StatelessWidget {
  final User user; // 유저 정보를 저장할 변수
  final DropdownButtonController dropdownController = Get.find<DropdownButtonController>();

  HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE2F1F6),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 200,),
            Text(
              '${user.name}님, 안녕하세요.',
              style: TextStyle(
                color: Color(0xFF404855),
                fontSize: 36,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '현재 로그인 되어 있는 채널은',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 119,
                  height: 32.23,
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFB9DFD3)),
                      borderRadius: BorderRadius.circular(38),
                    ),
                  ),
                  child: Obx(() => Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              dropdownController.currentItem.value ?? '채널을 선택하세요',
                              style: TextStyle(
                                color: Color(0xFF1E3932),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 0.12,
                                letterSpacing: 0.12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                ),
                SizedBox(width: 10),
                Text(
                  '입니다.',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                )
              ],
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 251,
                  height: 92,
                  decoration: ShapeDecoration(
                    color: Color(0xFF3FA7C3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '현재 채널 동기화',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 251,
                  height: 92,
                  decoration: ShapeDecoration(
                    color: Color(0xFF3FA7C3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '채널 변경하기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Text(
              '최근 동기화 2020.10.09',
              style: TextStyle(
                color: Color(0xFF404855),
                fontSize: 13,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
