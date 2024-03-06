import 'package:flutter/material.dart';

class BtBpSugar extends StatelessWidget {
  final int chartNumber;
  final double height;
  final double width;
  const BtBpSugar(
      {super.key,
      required this.chartNumber,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 470,
              height: 131,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 3,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          const Positioned(
            left: 15,
            top: 14,
            child: Text(
              '체온/혈당/혈압',
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
          Positioned(
            left: 161,
            top: 61,
            child: Container(
              width: 74,
              height: 25,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFB9DFD5)),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Positioned(
            left: 240,
            top: 61,
            child: Container(
              width: 74,
              height: 25,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFB9DFD5)),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          const Positioned(
            left: 161,
            top: 42,
            child: Text(
              '혈압',
              style: TextStyle(
                color: Color(0xFF404855),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 0.15,
              ),
            ),
          ),
          const Positioned(
            left: 171,
            top: 71,
            child: Text(
              '81',
              style: TextStyle(
                color: Color(0xFF404855),
                fontSize: 10,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 0.22,
                letterSpacing: -0.20,
              ),
            ),
          ),
          const Positioned(
            left: 250,
            top: 71,
            child: Text(
              '137',
              style: TextStyle(
                color: Color(0xFF404855),
                fontSize: 10,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 0.22,
                letterSpacing: -0.20,
              ),
            ),
          ),
          Positioned(
            left: 381,
            top: 40,
            child: SizedBox(
              width: 74,
              height: 11,
              child: Stack(
                children: [
                  const Positioned(
                    left: 0,
                    top: 2,
                    child: Text(
                      '공복',
                      style: TextStyle(
                        color: Color(0xFF404855),
                        fontSize: 10,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 0.15,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 41,
                    top: 2,
                    child: Text(
                      '식후',
                      style: TextStyle(
                        color: Color(0xFF404855),
                        fontSize: 10,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 0.15,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 22,
                    top: 0,
                    child: Container(
                      width: 11,
                      height: 11,
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(
                          side: BorderSide(width: 1, color: Color(0xFF67AB99)),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 2,
                    child: Container(
                      width: 7,
                      height: 7,
                      decoration: const ShapeDecoration(
                        color: Color(0xFF67AB99),
                        shape: OvalBorder(
                          side: BorderSide(width: 1, color: Color(0xFF67AB99)),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 63,
                    top: 0,
                    child: Container(
                      width: 11,
                      height: 11,
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(
                          side: BorderSide(width: 1, color: Color(0xFF67AB99)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 15,
            top: 61,
            child: Container(
              width: 131,
              height: 25,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFB9DFD5)),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Positioned(
            left: 326,
            top: 61,
            child: Container(
              width: 129,
              height: 25,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFB9DFD5)),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          const Positioned(
            left: 18,
            top: 42,
            child: Text(
              '체온',
              style: TextStyle(
                color: Color(0xFF404855),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 0.15,
              ),
            ),
          ),
          const Positioned(
            left: 329,
            top: 42,
            child: Text(
              '혈당',
              style: TextStyle(
                color: Color(0xFF404855),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 0.15,
              ),
            ),
          ),
          const Positioned(
            left: 25,
            top: 71,
            child: Text(
              '36',
              style: TextStyle(
                color: Color(0xFF404855),
                fontSize: 10,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 0.22,
                letterSpacing: -0.20,
              ),
            ),
          ),
          const Positioned(
            left: 336,
            top: 71,
            child: Text(
              '190',
              style: TextStyle(
                color: Color(0xFF404855),
                fontSize: 10,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 0.22,
                letterSpacing: -0.20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
