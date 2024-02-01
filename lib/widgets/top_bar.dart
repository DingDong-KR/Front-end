import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_desktop_app/screens/add_patient_screen.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize =>
      Size.fromHeight(49); // Adjust the height accordingly

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 49,
      decoration: BoxDecoration(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
          SizedBox(width: 10), // Add some spacing
          Stack(
            children: [
              Container(
                width: 328,
                height: 28,
                decoration: ShapeDecoration(
                  color: Color(0xFFF7F7F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                      border: InputBorder.none
                    ),
                    style:TextStyle(
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
          SizedBox(width: 30),

          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
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
                color: Color(0xFFE2F1F6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
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
          Spacer(),
          // Added Spacer to push '이수민' and the following texts to the right
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              '이수민',
              style: TextStyle(
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
              '2024-05-24',
              style: TextStyle(
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
              '20:12:44',
              style: TextStyle(
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
