import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../styles/textStyles.dart';

class Diagnosis extends StatefulWidget {
  final int chartNumber;
  final double width;
  final double height;

  const Diagnosis(
      {Key? key,
      required this.chartNumber,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  _DiagnosisState createState() => _DiagnosisState();
}

class _DiagnosisState extends State<Diagnosis> {
  int isMain = 0; //상병코드 주/부

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 400,
      height: widget.height,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: Text(
                  '진단',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      //width: 328,
                      height: 22,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF7F7F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(6, 0, 0, 3),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: '상병 코드 및 상병명을 입력하세요',
                              hintStyle: TextStyle(
                                color: Color(0xFFAFAFAF),
                                fontSize: 11,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
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
                      top: 2,
                      child: SvgPicture.asset('assets/icons/icon_search.svg'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          _buildIndexRow('주', '부', '상병코드', '상병명'),
          const SizedBox(
            height: 5,
          ),
          _buildItemRow("56543", "아래 허리 긴장, 요추부")
        ],
      ),
    );
  }

  Widget _buildIndexRow(String main, String sub, String code, String name) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Text(
          '$main ',
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            height: 0.12,
            letterSpacing: 0.12,
          ),
        ),
        const SizedBox(width: 24),
        Text(
          '$sub ',
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            height: 0.12,
            letterSpacing: 0.12,
          ),
        ),
        const SizedBox(width: 30),
        Text(
          '$code ',
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            height: 0.12,
            letterSpacing: 0.12,
          ),
        ),
        const SizedBox(width: 30),
        Text(
          '$name ',
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            height: 0.12,
            letterSpacing: 0.12,
          ),
        ),
      ],
    );
  }

  Widget _buildItemRow(String code, String name) {
    return Row(
      children: [
        _buildRadioButton(isMain, (newValue) {
          setState(() {
            isMain = newValue!;
          });
        }),
        const SizedBox(width: 30),
        Text(
          '$code ',
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            height: 0.12,
            letterSpacing: 0.12,
          ),
        ),
        const SizedBox(width: 30),
        Text(
          '$name ',
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            height: 0.12,
            letterSpacing: 0.12,
          ),
        ),
      ],
    );
  }

  Widget _buildRadioButton(int value, void Function(int?) onChanged) {
    return Row(
      children: [
        Radio(
          value: 1,
          groupValue: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF3FA7C3),
        ),
        const SizedBox(
          width: 5,
        ),
        Radio(
          value: 0,
          groupValue: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF3FA7C3),
        ),
      ],
    );
  }
}
