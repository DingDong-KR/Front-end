import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return Container(
      width: width,
      height: height,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10), // 왼쪽과 위쪽 여백 추가
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  '체온/혈당/혈압',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                const Text(
                  '최근 기록',
                  style: TextStyle(fontSize: 10),
                ),
                const SizedBox(width: 5),
                SvgPicture.asset('assets/icons/icon_record.svg'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '체온',
                      style: TextStyle(
                        fontSize: 12, // Example font size
                        color: Colors.black, // Example text color
                      ),
                    ),
                    Container(
                      width: 74,
                      height: 25,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFFB9DFD5)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "10",
                          style: TextStyle(
                            fontSize: 12, // Example font size
                            color: Colors.black, // Example text color
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '혈압',
                      style: TextStyle(
                        fontSize: 12, // Example font size
                        color: Colors.black, // Example text color
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 74,
                          height: 25,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Color(0xFFB9DFD5)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "10",
                              style: TextStyle(
                                fontSize: 12, // Example font size
                                color: Colors.black, // Example text color
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: 74,
                          height: 25,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Color(0xFFB9DFD5)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "10",
                              style: TextStyle(
                                fontSize: 12, // Example font size
                                color: Colors.black, // Example text color
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          '혈당',
                          style: TextStyle(
                            fontSize: 12, // Example font size
                            color: Colors.black, // Example text color
                          ),
                        ),
                        //Spacer(),
                        Text(
                          '공복',
                          style: TextStyle(
                            fontSize: 12, // Example font size
                            color: Colors.black, // Example text color
                          ),
                        ),
                        Text(
                          '식후',
                          style: TextStyle(
                            fontSize: 12, // Example font size
                            color: Colors.black, // Example text color
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 74,
                      height: 25,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFFB9DFD5)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "10",
                          style: TextStyle(
                            fontSize: 12, // Example font size
                            color: Colors.black, // Example text color
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
