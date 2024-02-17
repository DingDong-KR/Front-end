import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_desktop_app/repository/chart_crud_sql.dart';
import 'package:flutter/painting.dart'; // Add this import
import '../controller/dropdown_button_controller.dart';
import '../models/user_affiliation.dart';
import 'package:get/get.dart';

class AddAffiliationScreen extends StatefulWidget {
  final String userId;

  const AddAffiliationScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<AddAffiliationScreen> createState() => _AddAffiliationScreenState();
}

class _AddAffiliationScreenState extends State<AddAffiliationScreen> {
  final TextEditingController affiliationNameController = TextEditingController();

  // 유저 affiliation 저장하기 위한 함수
  Future<void> saveUserAffiliation() async {
    // 입력된 값들을 이용하여 userAffiliation 객체 생성
    final UserAffiliation newUserAffiliation = UserAffiliation(
      userId: widget.userId,
      affiliation: affiliationNameController.text,
    );
    // 데이터베이스에 affiliation 정보 추가
    final UserAffiliationProvider affiliationProvider = UserAffiliationProvider();
    await affiliationProvider.insertUserAffiliation(newUserAffiliation);

    // DropdownButtonWidget을 다시 빌드하도록 DropdownButtonController의 update() 메서드를 호출
    Get.find<DropdownButtonController>().update();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 600,
        height: 350,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFF3FA7C3)),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 110),
                GestureDetector(
                  onTap: () {
                    // 닫기 버튼이 눌렸을 때 실행되는 로직
                    Navigator.pop(context); // 예시로 현재 화면을 닫는 동작을 수행합니다.
                  },
                  child: Container(
                    width: 56.20,
                    height: 24,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFF3FA7C3)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '닫기',
                          style: TextStyle(
                            color: Color(0xFF3FA7C3),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 0.12,
                            letterSpacing: 0.12,
                          ),
                        ),
                        SvgPicture.asset('assets/icons/icon_x.svg'),
                      ],
                    ),
                  ),
                ), //닫기 버튼
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    saveUserAffiliation();
                    Navigator.pop(context); // 현재 화면을 닫는 동작을 수행
                  },
                  child: Container(
                    width: 56.20,
                    height: 24,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFF3FA7C3)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '완료',
                          style: TextStyle(
                            color: Color(0xFF3FA7C3),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 0.12,
                            letterSpacing: 0.12,
                          ),
                        ),
                        SvgPicture.asset('assets/icons/icon_checked.svg'),
                      ],
                    ),
                  ),
                ), //완료 버튼
                SizedBox(width: 15),
              ],
            ), //BT/BT/혈당 기록
            SizedBox(
              height: 30,
            ),
            Text(
              '채널 추가하기',
              style: TextStyle(
                color: Color(0xFF404855),
                fontSize: 20,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                letterSpacing: 0.14,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40,),
                    Container(
                      width: 300,
                      height: 50,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF7F7F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Center(
                        child: TextField(
                          textAlign: TextAlign.center,
                          maxLength: 8,
                          controller: affiliationNameController,
                          decoration: InputDecoration(
                            hintText: '8자 이내로 입력해주세요',
                            hintStyle: TextStyle(
                              color: Color(0xFFAFAFAF),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(0,2,0,0),
                          ),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
