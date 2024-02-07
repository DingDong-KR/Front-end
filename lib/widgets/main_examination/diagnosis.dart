import 'package:flutter/material.dart';

class Diagnosis extends StatelessWidget {
  const Diagnosis({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 506,
      height: 168,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '진단',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 0.11,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    height: 24,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF7F7F7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '상병코드 혹은 상병명을 검색하세요.',
                                style: TextStyle(
                                  color: Color(0xFFAFAFAF),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 0.15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 14.25,
                                height: 15.29,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: -0,
                                      top: 0,
                                      child: Container(
                                        width: 14.25,
                                        height: 15.29,
                                        decoration: const BoxDecoration(
                                            // image: DecorationImage(
                                            //   image: NetworkImage(
                                            //       "https://via.placeholder.com/14x15"),
                                            //   fit: BoxFit.fill,
                                            // ),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
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
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: 13,
                        height: 13,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 13,
                                height: 13,
                                decoration: const ShapeDecoration(
                                  shape: OvalBorder(
                                    side: BorderSide(
                                        width: 1, color: Color(0xFFD9D9D9)),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 3,
                              top: 3,
                              child: Container(
                                width: 7,
                                height: 7,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFF00C9FF),
                                  shape: OvalBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 35),
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
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
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: 13,
                        height: 13,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 13,
                                height: 13,
                                decoration: const ShapeDecoration(
                                  shape: OvalBorder(
                                    side: BorderSide(
                                        width: 1, color: Color(0xFFD9D9D9)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 35),
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '상병코드',
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
                      const SizedBox(height: 15),
                      Container(
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '56543',
                              style: TextStyle(
                                color: Color(0xFF404855),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 0.12,
                                letterSpacing: 0.12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 35),
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '상병명',
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
                      const SizedBox(height: 15),
                      Container(
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '아래 허리 긴장, 요추부',
                              style: TextStyle(
                                color: Color(0xFF404855),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 0.12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
