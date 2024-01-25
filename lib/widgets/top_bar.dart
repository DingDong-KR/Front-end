import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(49); // Adjust the height accordingly
  Widget build(BuildContext context) {
    return Container(
      width: 1300,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
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
          Container(
            width: 328,
            height: 28,
            decoration: ShapeDecoration(
              color: Color(0xFFF7F7F7),
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '환자이름 /차트번호/생년월일/휴대폰번호',
                  style: TextStyle(
                    color: Color(0xFFAFAFAF),
                    fontSize: 11,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0.18,
                  ),
                ),
                SvgPicture.asset('assets/icons/icon_search.svg'),
              ],
            ),
          ),
          Text(
            '이수민',
            style: TextStyle(
              color: Color(0xFF404855),
              fontSize: 12,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              height: 0.12,
            ),
          ),
          Text(
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
          Text(
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
          Container(
            width: 101,
            height: 28,
            decoration: ShapeDecoration(
              color: Color(0xFFE2F1F6),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            ),
            child:
            Row(
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

        ],
      ),
    );
  }
}
