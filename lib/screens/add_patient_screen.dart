import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddPatientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 500,
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
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '신규환자등록',
                      style: TextStyle(
                        color: Color(0xFF404855),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 70),
                    Container(
                      width: 56.20,
                      height: 24,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
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
                    SizedBox(width: 10),
                    Container(
                      width: 56.20,
                      height: 24,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
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
                    SizedBox(width: 15),
                  ],
                ),
              ), //신규환자등록
              SizedBox(
                height: 27,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    '환자번호',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0.15,
                    ),
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  Text(
                    '이름',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0.15,
                    ),
                  ),
                  SizedBox(
                    width: 160,
                  ),
                  Text(
                    '전화번호',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0.15,
                    ),
                  ),
                ],
              ), //환자번호
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    width: 59,
                    height: 22, // Set the width based on your requirements
                    child: TextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(6),
                        // Another way to limit the input length
                      ],
                      decoration: InputDecoration(
                        hintText: '000000',
                        hintStyle: TextStyle(
                          color: Color(0xFF3FA7C3),
                          fontSize: 10,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                        ),
                      ),
                      style: TextStyle(
                        color: Color(0xFF3FA7C3),
                        fontSize: 10,
                        fontFamily: 'Noto Sans KR',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Container(
                      width: 57,
                      height: 22,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: ShapeDecoration(
                        color: Color(0xFFF7F7F7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '남궁호연',
                            style: TextStyle(
                              color: Color(0xFFAFAFAF),
                              fontSize: 10,
                              fontFamily: 'Noto Sans KR',
                              fontWeight: FontWeight.w400,
                              height: 0.22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 125,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Container(
                      width: 190,
                      height: 22,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 45,
                            height: 22,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: ShapeDecoration(
                              color: Color(0xFFF7F7F7),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '010',
                                  style: TextStyle(
                                    color: Color(0xFFAFAFAF),
                                    fontSize: 10,
                                    fontFamily: 'Noto Sans KR',
                                    fontWeight: FontWeight.w400,
                                    height: 0.22,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 20,
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, bottom: 2),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '-',
                                  style: TextStyle(
                                    color: Color(0xFF404855),
                                    fontSize: 14,
                                    fontFamily: 'Noto Sans KR',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 22,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: ShapeDecoration(
                              color: Color(0xFFF7F7F7),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '0000',
                                  style: TextStyle(
                                    color: Color(0xFFAFAFAF),
                                    fontSize: 10,
                                    fontFamily: 'Noto Sans KR',
                                    fontWeight: FontWeight.w400,
                                    height: 0.22,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 20,
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, bottom: 2),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '-',
                                  style: TextStyle(
                                    color: Color(0xFF404855),
                                    fontSize: 14,
                                    fontFamily: 'Noto Sans KR',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 22,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: ShapeDecoration(
                              color: Color(0xFFF7F7F7),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '0000',
                                  style: TextStyle(
                                    color: Color(0xFFAFAFAF),
                                    fontSize: 10,
                                    fontFamily: 'Noto Sans KR',
                                    fontWeight: FontWeight.w400,
                                    height: 0.22,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ), //000000
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    '주소',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0.15,
                    ),
                  ),
                ],
              ), //주소
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    '우편번호',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 10,
                      fontFamily: 'Noto Sans KR',
                      fontWeight: FontWeight.w400,
                      height: 0.22,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 67.25,
                    height: 22,
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(width: 1, color: Color(0xFF3FA7C3)),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '검색하기',
                          style: TextStyle(
                            color: Color(0xFFAFAFAF),
                            fontSize: 10,
                            fontFamily: 'Noto Sans KR',
                            fontWeight: FontWeight.w400,
                            height: 0.22,
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 5,
                          child:
                              SvgPicture.asset('assets/icons/icon_search.svg'),
                        ),
                      ],
                    ),
                  ),
                ],
              ), //우편번호
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    '상세주소',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 10,
                      fontFamily: 'Noto Sans KR',
                      fontWeight: FontWeight.w400,
                      height: 0.22,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 369,
                    height: 22,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: ShapeDecoration(
                      color: Color(0xFFF7F7F7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '상세주소를 입력하세요.',
                          style: TextStyle(
                            color: Color(0xFFAFAFAF),
                            fontSize: 10,
                            fontFamily: 'Noto Sans KR',
                            fontWeight: FontWeight.w400,
                            height: 0.22,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ), // 상세주소
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    '주민등록번호',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0.15,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 195, 0),
                    child: Text(
                      '성별',
                      style: TextStyle(
                        color: Color(0xFF404855),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 0.15,
                      ),
                    ),
                  )
                ],
              ), //주민등록번호 성별
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    width: 59,
                    height: 22,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: ShapeDecoration(
                      color: Color(0xFFF7F7F7),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '641113',
                          style: TextStyle(
                            color: Color(0xFFAFAFAF),
                            fontSize: 10,
                            fontFamily: 'Noto Sans KR',
                            fontWeight: FontWeight.w400,
                            height: 0.22,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '-',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 14,
                      fontFamily: 'Noto Sans KR',
                      fontWeight: FontWeight.w400,
                      height: 0.11,
                      letterSpacing: 1.40,
                    ),
                  ),
                  Container(
                    width: 68,
                    height: 22,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: ShapeDecoration(
                      color: Color(0xFFF7F7F7),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '2205116',
                          style: TextStyle(
                            color: Color(0xFFAFAFAF),
                            fontSize: 10,
                            fontFamily: 'Noto Sans KR',
                            fontWeight: FontWeight.w400,
                            height: 0.22,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,90,0),
                      child: Row(children: [
                        Container(
                          width: 16,
                          height: 16,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: OvalBorder(
                                      side: BorderSide(
                                          width: 1, color: Color(0xFF3FA7C3)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '남',
                          style: TextStyle(
                            color: Color(0xFF404855),
                            fontSize: 12,
                            fontFamily: 'Noto Sans KR',
                            fontWeight: FontWeight.w400,
                            height: 0.15,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: 16,
                          height: 16,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: OvalBorder(
                                      side: BorderSide(
                                          width: 1, color: Color(0xFF3FA7C3)),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 3,
                                top: 3,
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF3FA7C3),
                                    shape: OvalBorder(
                                      side: BorderSide(
                                          width: 1, color: Color(0xFF3FA7C3)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '여',
                          style: TextStyle(
                            color: Color(0xFF404855),
                            fontSize: 12,
                            fontFamily: 'Noto Sans KR',
                            fontWeight: FontWeight.w400,
                            height: 0.15,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: 16,
                          height: 16,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: OvalBorder(
                                      side: BorderSide(
                                          width: 1, color: Color(0xFF3FA7C3)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '기타',
                          style: TextStyle(
                            color: Color(0xFF404855),
                            fontSize: 12,
                            fontFamily: 'Noto Sans KR',
                            fontWeight: FontWeight.w400,
                            height: 0.15,
                          ),
                        )
                      ]))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
