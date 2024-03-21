import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_desktop_app/models/user.dart';
import 'package:my_desktop_app/screens/add_patient_screen.dart';
import 'package:my_desktop_app/controller/affiliation_controller.dart';
import 'package:get/get.dart';
import 'package:my_desktop_app/styles/textStyles.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  final User user;
  const TopBar({Key? key, required this.user}) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();

  @override
  Size get preferredSize =>
      const Size.fromHeight(49); // Adjust the height accordingly
}

class _TopBarState extends State<TopBar> {
  String? affiliation;

  @override
  void initState() {
    super.initState();
  }

  Future<void> addPatientButtonClick() async {
    affiliation = Get.find<AffiliationController>()
        .currentAffiliation
        .value; //TODO:affiliation 이런식으로 글로벌하게 접근 가능
    if (affiliation == "") {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("경고"),
            content: const Text("채널을 선택하세요"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("확인"),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Dialog(
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: AddPatientScreen(),
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 49,
      decoration: const BoxDecoration(
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: Color(0x26000000),
        //     blurRadius: 4,
        //     offset: Offset(0, 0),
        //     spreadRadius: 0,
        //   ),
        // ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '환자검색',
              style: TextStyle(
                color: Color(0xFF404855),
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 0.09,
                letterSpacing: -0.18,
              ),
            ),
          ),
          const SizedBox(width: 10), // Add some spacing
          Stack(
            children: [
              Container(
                width: 328,
                height: 28,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF7F7F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: '환자이름/차트번호/생년월일/휴대폰번호',
                        hintStyle: TextStyle(
                          color: Color(0xFFAFAFAF),
                          fontSize: 11,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15, // Adjust the vertical padding
                        ),
                        border: InputBorder.none),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 5,
                child: SvgPicture.asset('assets/icons/icon_search.svg'),
              ),
            ],
          ),
          const SizedBox(width: 7),
          GestureDetector(
            onTap: () {
              addPatientButtonClick();
            },
            child: Container(
              width: 45,
              height: 28,
              decoration: ShapeDecoration(
                color: const Color(0xFFE2F1F6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset('assets/icons/icon_addPerson.svg'),
                ],
              ),
            ),
          ),
          const Spacer(),
          Container(
            child: Row(
              children: [
                Text(
                  '본진',
                  style: TextStyles.text12Style,
                ),
                SizedBox(width: 10),
                Container(
                  width: 60,
                  height: 22,
                  decoration: ShapeDecoration(
                    color: Color(0xFFE4F2EF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(34),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 9), // "본진" 텍스트와 "대기" 텍스트 사이의 간격 조정
                      Text(
                        '대기',
                        style: TextStyles.text12Style,
                      ),
                      SizedBox(width: 4), // "대기" 텍스트와 숫자 사이의 간격 조정
                      Container(
                        width: 24,
                        height: 18,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(4.0, 8, 0, 0),
                          child: Text(
                            '08',
                            style: TextStyles.text12W600Style,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 18,)
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Text(
                  '침구부',
                  style: TextStyles.text12Style,
                ),
                SizedBox(width: 10),
                Container(
                  width: 60,
                  height: 22,
                  decoration: ShapeDecoration(
                    color: Color(0xFFE4F2EF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(34),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 8), // "본진" 텍스트와 "대기" 텍스트 사이의 간격 조정
                      Text(
                        '베드',
                        style: TextStyles.text12Style,
                      ),
                      SizedBox(width: 2), // "대기" 텍스트와 숫자 사이의 간격 조정
                      Container(
                        width: 27,
                        height: 18,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(4.0, 8, 0, 0),
                          child: Text(
                            '3/6',
                            style: TextStyles.text12W600Style,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 9,)
        ],
      ),
    );
  }
}
