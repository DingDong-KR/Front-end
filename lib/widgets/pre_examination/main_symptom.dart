import 'package:flutter/material.dart';

class MainSymptom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 754,
      height: 393.50,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(5)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10), // 왼쪽과 위쪽 여백 추가
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '주증상',
              style: TextStyle(
                color: Color(0xFF404855),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
            SizedBox(height: 16), // 주증상과 추가 정보 사이 간격
            Text(
              '저녁에 열이 치솟음, 불면',
              style: TextStyle(
                color: Color(0xFF404855),
                fontSize: 11,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 1,
                letterSpacing: 0.11,
              ),
            )
          ],
        ),
      ),
    );
  }
}
