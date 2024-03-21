import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_desktop_app/models/user.dart';
import 'package:my_desktop_app/screens/add_patient_screen.dart';
import 'package:my_desktop_app/controller/affiliation_controller.dart';
import 'package:get/get.dart';

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
          const SizedBox(width: 30),

          GestureDetector(
            onTap: () {
              addPatientButtonClick();
            },
            child: Container(
              width: 101,
              height: 28,
              decoration: ShapeDecoration(
                color: const Color(0xFFE2F1F6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    '신규환자',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                      height: 0.11,
                      letterSpacing: -0.15,
                    ),
                  ),
                  SvgPicture.asset('assets/icons/icon_addPerson.svg'),
                ],
              ),
            ),
          ),
          const Spacer(),
          // Added Spacer to push '이수민' and the following texts to the right
        ],
      ),
    );
  }
}
