import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddPatientScreen extends StatefulWidget {
  const AddPatientScreen({super.key});

  @override
  State<AddPatientScreen> createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
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
              side: const BorderSide(width: 1, color: Color(0xFF3FA7C3)),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
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
                    const SizedBox(width: 70),
                    GestureDetector(
                      onTap: () {
                        // 닫기 버튼이 눌렸을 때 실행되는 로직
                        Navigator.pop(context); // 예시로 현재 화면을 닫는 동작을 수행합니다.
                      },
                      child: Container(
                        width: 56.20,
                        height: 24,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 3),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFF3FA7C3)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
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
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        // 완료 버튼이 눌렸을 때 실행되는 로직
                        Navigator.pop(context); // 현재 화면을 닫는 동작을 수행
                      },
                      child: Container(
                        width: 56.20,
                        height: 24,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 3),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFF3FA7C3)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
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
                    const SizedBox(width: 15),
                  ],
                ),
              ), //신규환자등록
              const SizedBox(
                height: 27,
              ),
              const Row(
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
                    '성별',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0.15,
                    ),
                  ),
                ],
              ), //환자번호, 이름
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  SizedBox(
                    width: 59,
                    height: 22, // Set the width based on your requirements
                    child: TextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(6),
                        // Another way to limit the input length
                      ],
                      decoration: const InputDecoration(
                        hintText: '000000',
                        hintStyle: TextStyle(
                          color: Color(0xFF3FA7C3),
                          fontSize: 10,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                        ),
                      ),
                      style: const TextStyle(
                        color: Color(0xFF3FA7C3),
                        fontSize: 10,
                        fontFamily: 'Noto Sans KR',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Container(
                      width: 57,
                      height: 22,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF7F7F7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      child: const Row(
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
                  const SizedBox(
                    width: 125,
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 90, 0),
                      child: Row(children: [
                        SizedBox(
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
                                  decoration: const ShapeDecoration(
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
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          '남',
                          style: TextStyle(
                            color: Color(0xFF404855),
                            fontSize: 12,
                            fontFamily: 'Noto Sans KR',
                            fontWeight: FontWeight.w400,
                            height: 0.15,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
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
                                  decoration: const ShapeDecoration(
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
                                  decoration: const ShapeDecoration(
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
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          '여',
                          style: TextStyle(
                            color: Color(0xFF404855),
                            fontSize: 12,
                            fontFamily: 'Noto Sans KR',
                            fontWeight: FontWeight.w400,
                            height: 0.15,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
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
                                  decoration: const ShapeDecoration(
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
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
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
              ), //000000
              const SizedBox(
                height: 16,
              ),
              const Row(
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
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  const Text(
                    '우편번호',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 10,
                      fontFamily: 'Noto Sans KR',
                      fontWeight: FontWeight.w400,
                      height: 0.22,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 67.25,
                    height: 22,
                    padding: const EdgeInsets.only(left: 10),
                    decoration: const BoxDecoration(
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
                        const Text(
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
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  const Text(
                    '상세주소',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 10,
                      fontFamily: 'Noto Sans KR',
                      fontWeight: FontWeight.w400,
                      height: 0.22,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 369,
                    height: 22,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF7F7F7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: const Row(
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
              const SizedBox(
                height: 50,
              ),
              const Row(
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
                ],
              ), //주민등록번호
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  Container(
                    width: 59,
                    height: 22,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF7F7F7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: const Row(
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
                  const Text(
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
                      color: const Color(0xFFF7F7F7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: const Row(
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
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
