import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_desktop_app/screens/add_affiliation_screen.dart';
import 'package:path/path.dart';
import '../controller/dropdown_button_controller.dart';
import 'package:my_desktop_app/models/user.dart';

class HomeScreen extends StatelessWidget {
  RxString lastSyncTime = RxString('');
  final User user; // 유저 정보를 저장할 변수
  final DropdownButtonController dropdownController = Get.find<
      DropdownButtonController>();

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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 9, vertical: 10),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFB9DFD3)),
                      borderRadius: BorderRadius.circular(38),
                    ),
                  ),
                  child: Obx(() =>
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                GestureDetector(
                  onTap: () {
                    syncronizeToServer(context); // Update lastSyncTime with the synchronization time
                  },
                  child: Container(
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
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                            child: Dialog(
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              child: AddAffiliationScreen(userId: user.userId,),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
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
                        '채널 추가하기',
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
                )
              ],
            ),
            SizedBox(height: 20,),
            Obx(() => Text(
              '최근 동기화 ${lastSyncTime.value}',
              style: TextStyle(
                color: Color(0xFF404855),
                fontSize: 13,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ))

          ],
        ),
      ),
    );
  }

  void syncronizeToServer(BuildContext context) {
    // Perform synchronization
    bool syncResult = true; // Replace with the actual synchronization result
    String synchronizationTime = '';
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // Wait for 2 seconds before closing the dialog
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop();
        });
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        );
      },
    );
    if (syncResult) {
      // Save the current time as the synchronization time
      DateTime now = DateTime.now();
      synchronizationTime = '${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}:${now.second}';
      // Update the UI with the new synchronization time
      lastSyncTime.value = synchronizationTime;
      // Stop the sync animation
    } else {
      // Stop the sync animation
    }
  }

}
