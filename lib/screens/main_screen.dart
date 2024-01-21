import 'package:flutter/material.dart';
import 'package:my_desktop_app/screens/login_screen.dart';
import 'package:my_desktop_app/widgets/left_drawer.dart';

class MainScreen extends StatefulWidget {
  final String loggedInID;
  const MainScreen({Key? key, required this.loggedInID}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LeftDrawer(),
      body: Container(
        width: 3024,
        height: 1964,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            const Positioned(
              left: 148,
              top: 79,
              child: Text(
                '환자리스트',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 17,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 235,
              top: 76,
              child: Container(
                width: 100,
                height: 26,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF7F7F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.50),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 235,
              top: 76,
              child: Container(
                width: 50,
                height: 25,
                decoration: ShapeDecoration(
                  color: const Color(0xFFBBF2D7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 247,
              top: 80,
              child: Text(
                '본진',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 15,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            const Positioned(
              left: 297,
              top: 80,
              child: Text(
                '침구',
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 15,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 147,
              top: 119,
              child: Container(
                width: 188,
                height: 83,
                decoration: ShapeDecoration(
                  color: const Color(0xFFE5F9EF),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFBBF2D8)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 147,
              top: 208,
              child: Container(
                width: 188,
                height: 83,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF7F7F7),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            Positioned(
              left: 147,
              top: 296,
              child: Container(
                width: 188,
                height: 83,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF7F7F7),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            Positioned(
              left: 345,
              top: 29,
              child: Container(
                width: 1255,
                height: 871,
                decoration: const BoxDecoration(color: Color(0xFFF7F7F7)),
              ),
            ),
            Positioned(
              left: 355,
              top: 322,
              child: Container(
                width: 298,
                height: 568,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 656,
              top: 112,
              child: Container(
                width: 934,
                height: 344,
                decoration: const BoxDecoration(color: Colors.white),
              ),
            ),
            Positioned(
              left: 656,
              top: 112,
              child: Container(
                width: 387,
                height: 344,
                decoration: const BoxDecoration(color: Colors.white),
              ),
            ),
            Positioned(
              left: 656,
              top: 459,
              child: Container(
                width: 679,
                height: 142,
                decoration: const BoxDecoration(color: Colors.white),
              ),
            ),
            Positioned(
              left: 1338,
              top: 459,
              child: Container(
                width: 252,
                height: 431,
                decoration: const BoxDecoration(color: Colors.white),
              ),
            ),
            Positioned(
              left: 355,
              top: 71,
              child: Container(
                width: 1235,
                height: 38,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 156,
              top: 128,
              child: Container(
                width: 37,
                height: 15,
                decoration: ShapeDecoration(
                  color: const Color(0xFFBBF2D8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.50),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 156,
              top: 217,
              child: Container(
                width: 37,
                height: 15,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.50),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 156,
              top: 305,
              child: Container(
                width: 37,
                height: 15,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.50),
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 286,
              top: 182,
              child: Text(
                '14:01:25',
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 10,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.15,
                  letterSpacing: 0.10,
                ),
              ),
            ),
            const Positioned(
              left: 286,
              top: 271,
              child: Text(
                '16:04:55',
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 10,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.15,
                  letterSpacing: 0.10,
                ),
              ),
            ),
            const Positioned(
              left: 286,
              top: 359,
              child: Text(
                '14:12:25',
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 10,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.15,
                  letterSpacing: 0.10,
                ),
              ),
            ),
            const Positioned(
              left: 157,
              top: 148,
              child: Text(
                '이수민',
                style: TextStyle(
                  color: Color(0xFF55A798),
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.09,
                  letterSpacing: 0.16,
                ),
              ),
            ),
            const Positioned(
              left: 418,
              top: 78,
              child: Text(
                '이수민',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.09,
                  letterSpacing: 0.16,
                ),
              ),
            ),
            const Positioned(
              left: 157,
              top: 237,
              child: Text(
                '김민수',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.09,
                  letterSpacing: 0.16,
                ),
              ),
            ),
            const Positioned(
              left: 157,
              top: 325,
              child: Text(
                '박수자',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.09,
                  letterSpacing: 0.16,
                ),
              ),
            ),
            const Positioned(
              left: 157,
              top: 179,
              child: Text(
                '여,52 다리아픔',
                style: TextStyle(
                  color: Color(0xFF56A799),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.12,
                  letterSpacing: 0.12,
                ),
              ),
            ),
            const Positioned(
              left: 157,
              top: 268,
              child: Text(
                '남,92 팔,허리 아픔',
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
            const Positioned(
              left: 157,
              top: 356,
              child: Text(
                '여,72 어깨아픔',
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
            const Positioned(
              left: 163,
              top: 127,
              child: Text(
                '002',
                style: TextStyle(
                  color: Color(0xFF56A799),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 0.12,
                  letterSpacing: 0.12,
                ),
              ),
            ),
            const Positioned(
              left: 389,
              top: 81,
              child: Text(
                '002',
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
            const Positioned(
              left: 475,
              top: 81,
              child: Text(
                '여',
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
            const Positioned(
              left: 500,
              top: 81,
              child: Text(
                '52세 (1973-06-04)',
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
            const Positioned(
              left: 164,
              top: 216,
              child: Text(
                '122',
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
            const Positioned(
              left: 163,
              top: 304,
              child: Text(
                '332',
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
            const Positioned(
              left: 286,
              top: 127,
              child: Text(
                '진료중',
                style: TextStyle(
                  color: Color(0xFF11E058),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.12,
                  letterSpacing: 0.12,
                ),
              ),
            ),
            const Positioned(
              left: 297,
              top: 216,
              child: Text(
                '응급',
                style: TextStyle(
                  color: Color(0xFFFF3120),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.12,
                  letterSpacing: 0.12,
                ),
              ),
            ),
            const Positioned(
              left: 286,
              top: 304,
              child: Text(
                '대기중',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.12,
                  letterSpacing: 0.12,
                ),
              ),
            ),
            Positioned(
              left: 137,
              top: 0,
              child: Container(
                width: 1463,
                height: 61,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 4,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 167,
              top: 16,
              child: Text(
                '환자검색',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 20,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.07,
                  letterSpacing: -0.22,
                ),
              ),
            ),
            Positioned(
              left: 592,
              top: 16,
              child: Container(
                width: 100,
                height: 31,
                decoration: ShapeDecoration(
                  color: const Color(0xFFE5F9EF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            const Positioned(
              left: 630,
              top: 21,
              child: Text(
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
            ),
            Positioned(
              left: 254,
              top: 16,
              child: Container(
                width: 328,
                height: 31,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF7F7F7),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            Positioned(
              left: 1352,
              top: 428,
              child: Container(
                width: 222,
                height: 31,
                decoration: ShapeDecoration(
                  color: const Color(0xFFE5F9EF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            const Positioned(
              left: 263,
              top: 21,
              child: Text(
                '환자이름/차트번호/생년월일/휴대폰번호',
                style: TextStyle(
                  color: Color(0xFFAFAFAF),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.15,
                ),
              ),
            ),
            Positioned(
              left: 548,
              top: 21,
              child: Container(
                width: 16.91,
                height: 18,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 7.43,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(-0.71),
                        child: Container(
                          width: 11.45,
                          height: 11.45,
                          decoration: const ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0xFF56A799)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 370,
              top: 83,
              child: Container(
                width: 13.31,
                height: 14.20,
                child: const Stack(children: [
                ]),
              ),
            ),
            Positioned(
              left: 604,
              top: 24,
              child: Container(
                width: 19,
                height: 14.20,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 13.31,
                        height: 14.20,
                        child: const Stack(children: [
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 321,
              top: 133,
              child: Container(
                width: 5,
                height: 5,
                decoration: const ShapeDecoration(
                  color: Color(0xFF11E058),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 321,
              top: 222,
              child: Container(
                width: 5,
                height: 5,
                decoration: const ShapeDecoration(
                  color: Color(0xFFFF3120),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 321,
              top: 310,
              child: Container(
                width: 5,
                height: 5,
                decoration: const ShapeDecoration(
                  color: Color(0xFFFFBD16),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 137,
              top: 0,
              child: Container(
                width: 11,
                height: 61,
                decoration: const ShapeDecoration(
                  color: Color(0xFFBBF2D8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 1338,
              top: 112,
              child: Container(
                width: 252,
                height: 275,
                decoration: const BoxDecoration(color: Colors.white),
              ),
            ),
            Positioned(
              left: 355,
              top: 112,
              child: Container(
                width: 148,
                height: 102,
                decoration: const BoxDecoration(color: Colors.white),
              ),
            ),
            Positioned(
              left: 505,
              top: 112,
              child: Container(
                width: 148,
                height: 102,
                decoration: const BoxDecoration(color: Colors.white),
              ),
            ),
            Positioned(
              left: 355,
              top: 217,
              child: Container(
                width: 298,
                height: 102,
                decoration: const BoxDecoration(color: Colors.white),
              ),
            ),
            Positioned(
              left: 1459,
              top: 359,
              child: Container(
                width: 48,
                height: 15,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF7F7F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.50),
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1449,
              top: 115,
              child: SizedBox(
                width: 32,
                height: 13,
                child: Text(
                  '2024년',
                  style: TextStyle(
                    color: Color(0xFFAFAFAF),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0.22,
                    letterSpacing: -0.20,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1455,
              top: 134,
              child: SizedBox(
                width: 24,
                height: 16,
                child: Text(
                  '5월',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 0.15,
                    letterSpacing: -0.24,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 1423,
              top: 140,
              child: Container(
                width: 79.96,
                height: 8.27,
                child: const Stack(children: [
                ]),
              ),
            ),
            const Positioned(
              left: 1352,
              top: 164,
              child: SizedBox(
                width: 21,
                height: 11,
                child: Text(
                  'Sun',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFAFAFAF),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1386,
              top: 164,
              child: SizedBox(
                width: 21,
                height: 11,
                child: Text(
                  'Mon',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFAFAFAF),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1420,
              top: 164,
              child: SizedBox(
                width: 21,
                height: 11,
                child: Text(
                  'Tue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFAFAFAF),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1454,
              top: 164,
              child: SizedBox(
                width: 21,
                height: 11,
                child: Text(
                  'Wed',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFAFAFAF),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1488,
              top: 164,
              child: SizedBox(
                width: 21,
                height: 11,
                child: Text(
                  'Thu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFAFAFAF),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1522,
              top: 164,
              child: SizedBox(
                width: 21,
                height: 11,
                child: Text(
                  'Fri',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFAFAFAF),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1556,
              top: 164,
              child: SizedBox(
                width: 21,
                height: 11,
                child: Text(
                  'Sat',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFAFAFAF),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1356,
              top: 304,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '22',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1390,
              top: 304,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '23',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1424,
              top: 304,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '24',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1458,
              top: 304,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '25',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1494,
              top: 304,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '26',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1526,
              top: 304,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '27',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1560,
              top: 304,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '28',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1356,
              top: 343,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '29',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1390,
              top: 343,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '30',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1424,
              top: 343,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '31',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1458,
              top: 343,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '1',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0x7F999999),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1494,
              top: 343,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '2',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0x7F999999),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1526,
              top: 343,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '3',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0x7F999999),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1560,
              top: 343,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '4',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0x7F999999),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1360,
              top: 226,
              child: SizedBox(
                width: 5,
                height: 8,
                child: Text(
                  '8',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1394,
              top: 226,
              child: SizedBox(
                width: 5,
                height: 8,
                child: Text(
                  '9',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1424,
              top: 226,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '10',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1458,
              top: 226,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '11',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1494,
              top: 226,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '12',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1526,
              top: 226,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '13',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1560,
              top: 226,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '14',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1356,
              top: 187,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '1',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1390,
              top: 187,
              child: SizedBox(
                width: 13,
                height: 13,
                child: Text(
                  '2',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1424,
              top: 187,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '3',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1458,
              top: 187,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '4',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1494,
              top: 187,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '5',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1526,
              top: 187,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '6',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1560,
              top: 187,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '7',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1356,
              top: 265,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '15',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1390,
              top: 265,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '16',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1424,
              top: 265,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '17',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1458,
              top: 265,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '18',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1494,
              top: 265,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '19',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1526,
              top: 265,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '20',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF11E058),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1560,
              top: 265,
              child: SizedBox(
                width: 13,
                height: 8,
                child: Text(
                  '21',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 1386,
              top: 203,
              child: Container(
                width: 123,
                height: 15,
                decoration: ShapeDecoration(
                  color: const Color(0xFFE5F9EF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.50),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 1488,
              top: 219,
              child: Container(
                width: 92,
                height: 22,
                decoration: ShapeDecoration(
                  color: const Color(0xFFE5F9EF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.50),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 1424,
              top: 281,
              child: Container(
                width: 153,
                height: 15,
                decoration: ShapeDecoration(
                  color: const Color(0xFFE5F9EF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.50),
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1405,
              top: 204,
              child: SizedBox(
                width: 86,
                height: 11,
                child: Text(
                  '강원도 영월 의료봉사 ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1455,
              top: 282,
              child: SizedBox(
                width: 92,
                height: 11,
                child: Text(
                  '전라북도 고창 의료봉사 ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1464,
              top: 360,
              child: SizedBox(
                width: 39,
                height: 11,
                child: Text(
                  '전주 봉사',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFD9D9D9),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1352,
              top: 400,
              child: Text(
                '오더세트',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.11,
                  letterSpacing: 0.14,
                ),
              ),
            ),
            const Positioned(
              left: 1374,
              top: 472,
              child: Text(
                '즐겨찾기(2)',
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
            const Positioned(
              left: 1374,
              top: 500,
              child: Text(
                '경추통(3)',
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
            const Positioned(
              left: 369,
              top: 332,
              child: Text(
                '내원이력',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.11,
                ),
              ),
            ),
            const Positioned(
              left: 587,
              top: 333,
              child: Text(
                '최신순',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.12,
                ),
              ),
            ),
            const Positioned(
              left: 369,
              top: 398,
              child: Text(
                '진료기록',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.12,
                ),
              ),
            ),
            const Positioned(
              left: 602,
              top: 400,
              child: Text(
                'Repeat',
                style: TextStyle(
                  color: Color(0xFF56A799),
                  fontSize: 10,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.15,
                  letterSpacing: 0.10,
                ),
              ),
            ),
            const Positioned(
              left: 602,
              top: 497,
              child: Text(
                'Repeat',
                style: TextStyle(
                  color: Color(0xFF56A799),
                  fontSize: 10,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.15,
                  letterSpacing: 0.10,
                ),
              ),
            ),
            const Positioned(
              left: 602,
              top: 559,
              child: Text(
                'Repeat',
                style: TextStyle(
                  color: Color(0xFF56A799),
                  fontSize: 10,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.15,
                  letterSpacing: 0.10,
                ),
              ),
            ),
            const Positioned(
              left: 602,
              top: 668,
              child: Text(
                'Repeat',
                style: TextStyle(
                  color: Color(0xFF56A799),
                  fontSize: 10,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.15,
                  letterSpacing: 0.10,
                ),
              ),
            ),
            const Positioned(
              left: 369,
              top: 495,
              child: Text(
                '상병',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.12,
                ),
              ),
            ),
            const Positioned(
              left: 369,
              top: 558,
              child: Text(
                '침구/물리요법',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.12,
                ),
              ),
            ),
            const Positioned(
              left: 561,
              top: 859,
              child: Text(
                '환자추가정보',
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.12,
                  letterSpacing: 0.12,
                ),
              ),
            ),
            const Positioned(
              left: 369,
              top: 667,
              child: Text(
                '방약',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.12,
                ),
              ),
            ),
            const Positioned(
              left: 369,
              top: 122,
              child: Text(
                'ROS',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.11,
                  letterSpacing: 0.14,
                ),
              ),
            ),
            const Positioned(
              left: 516,
              top: 122,
              child: Text(
                '주증상',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.11,
                  letterSpacing: 0.14,
                ),
              ),
            ),
            const Positioned(
              left: 670,
              top: 122,
              child: Text(
                '진료기록',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.11,
                  letterSpacing: 0.14,
                ),
              ),
            ),
            const Positioned(
              left: 670,
              top: 469,
              child: Text(
                '상병',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.11,
                  letterSpacing: 0.14,
                ),
              ),
            ),
            const Positioned(
              left: 670,
              top: 616,
              child: Text(
                '침구/물리요법',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.11,
                  letterSpacing: 0.14,
                ),
              ),
            ),
            const Positioned(
              left: 670,
              top: 647,
              child: Text(
                '침치료',
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
            const Positioned(
              left: 727,
              top: 647,
              child: Text(
                '약침',
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.12,
                  letterSpacing: 0.12,
                ),
              ),
            ),
            const Positioned(
              left: 790,
              top: 647,
              child: Text(
                '부항',
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.12,
                  letterSpacing: 0.12,
                ),
              ),
            ),
            const Positioned(
              left: 843,
              top: 647,
              child: Text(
                '뜸',
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.12,
                  letterSpacing: 0.12,
                ),
              ),
            ),
            const Positioned(
              left: 887,
              top: 647,
              child: Text(
                '물리요법',
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.12,
                  letterSpacing: 0.12,
                ),
              ),
            ),
            const Positioned(
              left: 778,
              top: 616,
              child: Text(
                '방약',
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.11,
                  letterSpacing: 0.14,
                ),
              ),
            ),
            Positioned(
              left: 906,
              top: 766,
              child: Transform(
                transform: Matrix4.identity()
                  ..translate(0.0, 0.0)
                  ..rotateZ(-3.14),
                child: const Text(
                  '?',
                  style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 40,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0.04,
                    letterSpacing: 0.40,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 753,
              top: 123,
              child: Text(
                '2024-05-20 16:20',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 0.12,
                  letterSpacing: 0.12,
                ),
              ),
            ),
            const Positioned(
              left: 369,
              top: 227,
              child: Text(
                '간호노트',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.11,
                ),
              ),
            ),
            const Positioned(
              left: 1335,
              top: 19,
              child: Text(
                '20:12:44',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 0.09,
                  letterSpacing: 0.16,
                ),
              ),
            ),
            const Positioned(
              left: 1425,
              top: 24,
              child: Text(
                'Friday, 20 May',
                style: TextStyle(
                  color: Color(0xFFAFAFAF),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 0.12,
                  letterSpacing: 0.12,
                ),
              ),
            ),
            Positioned(
              left: 1544,
              top: 18,
              child: Container(
                width: 26,
                height: 26,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 26,
                        height: 26,
                        decoration: const ShapeDecoration(
                          shape: OvalBorder(
                            side: BorderSide(
                                width: 1, color: Color(0xFF404855)),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 7,
                      top: 8,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://via.placeholder.com/12x12"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1, color: Color(0xFF404855)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 1570,
              top: 40,
              child: Container(
                width: 4,
                height: 4,
                decoration: const ShapeDecoration(
                  color: Color(0xFF11E058),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 1489,
              top: 79,
              child: Container(
                width: 87,
                height: 24,
                decoration: ShapeDecoration(
                  color: const Color(0xFFE5F9EF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            Positioned(
              left: 1235,
              top: 119,
              child: Container(
                width: 88,
                height: 24,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFAFAFAF)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1501,
              top: 81,
              child: Text(
                '진료완료',
                style: TextStyle(
                  color: Color(0xFF55A798),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 0.11,
                  letterSpacing: 0.14,
                ),
              ),
            ),
            const Positioned(
              left: 1243,
              top: 123,
              child: Text(
                '이미지 첨부',
                style: TextStyle(
                  color: Color(0xFFAFAFAF),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.12,
                  letterSpacing: 0.12,
                ),
              ),
            ),
            const Positioned(
              left: 1424,
              top: 81,
              child: Text(
                '침구실',
                style: TextStyle(
                  color: Color(0xFFAFAFAF),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 0.11,
                  letterSpacing: 0.14,
                ),
              ),
            ),
            Positioned(
              left: 1411,
              top: 79,
              child: Container(
                width: 71,
                height: 24,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFAFAFAF)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 362,
              top: 152,
              child: Text(
                '식욕부진\n오한',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.12,
                  letterSpacing: -0.13,
                ),
              ),
            ),
            const Positioned(
              left: 516,
              top: 152,
              child: Text(
                '허벅지 통증',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.12,
                  letterSpacing: -0.13,
                ),
              ),
            ),
            const Positioned(
              left: 371,
              top: 257,
              child: Text(
                '허벅지 통증 심하시다고 하심, 성격 예민',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.12,
                ),
              ),
            ),
            const Positioned(
              left: 369,
              top: 367,
              child: Text(
                '2024.04.14',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.12,
                  letterSpacing: 0.12,
                ),
              ),
            ),
            const Positioned(
              left: 464,
              top: 367,
              child: Text(
                '2024.04.12',
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.12,
                  letterSpacing: 0.12,
                ),
              ),
            ),
            const Positioned(
              left: 554,
              top: 367,
              child: Text(
                '2024.04.08',
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.12,
                  letterSpacing: 0.12,
                ),
              ),
            ),
            Positioned(
              left: 472,
              top: 126,
              child: Container(
                width: 10,
                height: 12.50,
                child: const Stack(children: [
                ]),
              ),
            ),
            const Positioned(
              left: 619,
              top: 82,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'BT : ',
                      style: TextStyle(
                        color: Color(0xFF404855),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                        letterSpacing: -0.13,
                      ),
                    ),
                    TextSpan(
                      text: '12 ',
                      style: TextStyle(
                        color: Color(0xFF404855),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 0.12,
                        letterSpacing: -0.13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 671,
              top: 82,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'BP : ',
                      style: TextStyle(
                        color: Color(0xFF404855),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                        letterSpacing: -0.13,
                      ),
                    ),
                    TextSpan(
                      text: '50 ',
                      style: TextStyle(
                        color: Color(0xFF404855),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 0.12,
                        letterSpacing: -0.13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 725,
              top: 82,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '혈당 : ',
                      style: TextStyle(
                        color: Color(0xFFFF3120),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                        letterSpacing: -0.13,
                      ),
                    ),
                    TextSpan(
                      text: '150',
                      style: TextStyle(
                        color: Color(0xFFFF3120),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 0.12,
                        letterSpacing: -0.13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 671,
              top: 152,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'S) \nc/c\n#1. Rt. leg tingling sensation \n-',
                      style: TextStyle(
                        color: Color(0xFF404855),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                        letterSpacing: 0.12,
                      ),
                    ),
                    TextSpan(
                      text: ' 우측 둔부, 하지 후면부 저림\n- 보행 시 가장 통증이 심함\n- 아침에 일어날 때 통증 심화\n',
                      style: TextStyle(
                        color: Color(0xFF404855),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                      ),
                    ),
                    TextSpan(
                      text: '\no/s 6MA\n\nO)\nP/e\n',
                      style: TextStyle(
                        color: Color(0xFF404855),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                        letterSpacing: 0.12,
                      ),
                    ),
                    TextSpan(
                      text: 'SLRT (-/-)\nFemoral nerve strech test(+/-)',
                      style: TextStyle(
                        color: Color(0xFF404855),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                        letterSpacing: 0.12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 737,
              top: 127,
              child: Container(
                width: 10,
                height: 10.50,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 1,
                      child: Container(
                        width: 10,
                        height: 9.50,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFF404855)),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 1303,
              top: 126,
              child: Container(
                width: 11,
                height: 11,
                child: const Stack(children: [
                ]),
              ),
            ),
            Positioned(
              left: 1318,
              top: 156,
              child: Container(
                width: 4,
                height: 283,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF7F7F7),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            Positioned(
              left: 1318,
              top: 156,
              child: Container(
                width: 4,
                height: 102,
                decoration: ShapeDecoration(
                  color: const Color(0xFFBBF2D8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            Positioned(
              left: 1084,
              top: 156,
              child: Container(
                width: 220,
                height: 257,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 3, color: Color(0xFFE5F9EF)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 1088,
              top: 163,
              child: Container(
                width: 192,
                height: 230,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/192x230"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 1362,
              top: 433,
              child: Text(
                '오더세트검색',
                style: TextStyle(
                  color: Color(0xFFAFAFAF),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.15,
                ),
              ),
            ),
            Positioned(
              left: 1544,
              top: 433,
              child: Container(
                width: 16.91,
                height: 18,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 7.43,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(-0.71),
                        child: Container(
                          width: 11.45,
                          height: 11.45,
                          decoration: const ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0xFF56A799)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 25.22,
              top: 302.36,
              child: Container(
                width: 13.78,
                height: 11.27,
                child: const Stack(children: [
                ]),
              ),
            ),
            const Positioned(
              left: 671,
              top: 499,
              child: SizedBox(
                width: 12,
                child: Text(
                  '주',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                    letterSpacing: -0.13,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 716,
              top: 499,
              child: SizedBox(
                width: 13,
                child: Text(
                  '부',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                    letterSpacing: -0.13,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 762,
              top: 499,
              child: SizedBox(
                width: 48,
                child: Text(
                  '상병코드',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                    letterSpacing: -0.13,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 764,
              top: 527,
              child: SizedBox(
                width: 41,
                child: Text(
                  '56543',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 0.12,
                    letterSpacing: -0.13,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 843,
              top: 527,
              child: SizedBox(
                width: 125,
                child: Text(
                  '아래 허리 긴장, 요추부',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 0.12,
                    letterSpacing: -0.13,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 362,
              top: 520,
              child: SizedBox(
                width: 200,
                child: Text(
                  '주상병 56543 아래 허리 긴장, 요추부',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 362,
              top: 583,
              child: SizedBox(
                width: 200,
                child: Text(
                  '주상병 56543 아래 허리 긴장, 요추부',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 362,
              top: 692,
              child: SizedBox(
                width: 200,
                child: Text(
                  '주상병 56543 아래 허리 긴장, 요추부',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 362,
              top: 714,
              child: SizedBox(
                width: 200,
                child: Text(
                  '주상병 56543 아래 허리 긴장, 요추부',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 362,
              top: 605,
              child: SizedBox(
                width: 200,
                child: Text(
                  '주상병 56543 아래 허리 긴장, 요추부',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 362,
              top: 627,
              child: SizedBox(
                width: 200,
                child: Text(
                  '주상병 56543 아래 허리 긴장, 요추부',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 843,
              top: 499,
              child: SizedBox(
                width: 48,
                child: Text(
                  '상병명',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                    letterSpacing: -0.13,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 670,
              top: 529,
              child: Container(
                width: 13,
                height: 13,
                decoration: const ShapeDecoration(
                  shape: OvalBorder(
                    side: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 716,
              top: 529,
              child: Container(
                width: 12,
                height: 12,
                decoration: const ShapeDecoration(
                  shape: OvalBorder(
                    side: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 673,
              top: 532,
              child: Container(
                width: 7,
                height: 7,
                decoration: const ShapeDecoration(
                  color: Color(0xFF11E058),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 370,
              top: 419,
              child: Container(
                width: 268,
                height: 62,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF7F7F7),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            const Positioned(
              left: 380,
              top: 423,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'S) c/c #1. Rt. leg tingling sensation \n-',
                      style: TextStyle(
                        color: Color(0xFF404855),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                        letterSpacing: 0.12,
                      ),
                    ),
                    TextSpan(
                      text: ' 우측 둔부, 하지 후면부 저림\n- 보행 시 가장 통증이 심함',
                      style: TextStyle(
                        color: Color(0xFF404855),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 627,
              top: 422,
              child: Container(
                width: 4,
                height: 56,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            Positioned(
              left: 627,
              top: 422,
              child: Container(
                width: 4,
                height: 19,
                decoration: ShapeDecoration(
                  color: const Color(0xFFBBF2D8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            Positioned(
              left: 712,
              top: 467,
              child: Container(
                width: 613,
                padding: const EdgeInsets.only(
                  top: 3,
                  left: 6,
                  right: 75,
                  bottom: 3,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.black.withOpacity(0.5), width: 1),
                    top: BorderSide(color: Colors.black.withOpacity(0.5), width: 1),
                    right: BorderSide(color: Colors.black.withOpacity(0.5), width: 1),
                    bottom: BorderSide(color: Colors.black.withOpacity(0.5), width: 1),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(),
                      child: const Stack(children: [
                        // Add your content here
                      ]),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      '상병 코드 혹은 상병명을 입력해주세요.',
                      style: TextStyle(
                        color: Color(0x7F1E1E1E),
                        fontSize: 10,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 0.15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 1530,
              top: 207,
              child: Container(
                width: 6,
                height: 6,
                decoration: const ShapeDecoration(
                  color: Color(0xFF11E058),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 1530,
              top: 215,
              child: Container(
                width: 6,
                height: 6,
                decoration: const ShapeDecoration(
                  color: Color(0xFFE5F9EF),
                  shape: StarBorder.polygon(sides: 3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
