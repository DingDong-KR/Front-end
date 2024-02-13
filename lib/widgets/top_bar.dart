import 'dart:async';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_desktop_app/models/user.dart';
import 'package:my_desktop_app/screens/add_patient_screen.dart';

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
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();

    // 초기에 현재 시간을 가져와서 설정
    _currentTime = DateTime.now();

    // 1초마다 화면을 업데이트하는 타이머 설정
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (mounted) {
        // 화면이 소멸되면 타이머를 중단하기 위해 체크
        setState(() {
          _currentTime = DateTime.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 49,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Doc. ${widget.user.name}',
              style: const TextStyle(
                color: Color(0xFF404855),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 0.12,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              DateFormat('yyyy-MM-dd').format(_currentTime),
              style: const TextStyle(
                color: Color(0xFF404855),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 0.12,
                letterSpacing: 0.12,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              DateFormat('HH:mm:ss').format(_currentTime),
              style: const TextStyle(
                color: Color(0xFF404855),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 0.12,
                letterSpacing: 0.12,
              ),
            ),
          ),
          SvgPicture.asset('assets/icons/icon_lining.svg'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SvgPicture.asset('assets/icons/icon_message.svg'),
          ),
        ],
      ),
    );
  }
}
