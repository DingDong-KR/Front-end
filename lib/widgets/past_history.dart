import 'package:flutter/material.dart';

class PastHistory extends StatelessWidget {
  final int chartNumber;
  final double width;
  final double height;
  const PastHistory({
    super.key,
    required this.chartNumber,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.white,
      child: const Padding(
        padding: EdgeInsets.all(10), // 왼쪽과 위쪽 여백 추가
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '과거력',
              style: TextStyle(
                color: Color(0xFF404855),
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 1), // 주증상과 추가 정보 사이 간격
            // TextField(
            //   cursorHeight: 8.0,
            //   controller: mainSymptomController,
            //   onChanged: (value) {
            //     // mainSymptom의 값을 변경합니다.
            //     preExaminationController.updateMainSymptom(value);
            //     print(
            //         '저장하는 주증상: ${preExaminationController.mainSymptom.value}');
            //   },
            //   maxLines: 5,
            //   decoration: const InputDecoration(
            //       hintStyle: TextStyle(
            //         color: Color(0xFFAFAFAF),
            //         fontSize: 11,
            //         fontFamily: 'Pretendard',
            //         fontWeight: FontWeight.w400,
            //       ),
            //       contentPadding: EdgeInsets.symmetric(
            //         vertical: 15,
            //       ),
            //       border: InputBorder.none),
            //   style: TextStyles.text11Style
            //       .copyWith(height: 1.5), // height 값을 조절해주세요
            // ),
          ],
        ),
      ),
    );
  }
}
