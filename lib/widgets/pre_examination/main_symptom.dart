import 'package:flutter/material.dart';

class MainSymptom extends StatelessWidget {
  final int chartNumber;
  MainSymptom({Key? key, required this.chartNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 629,
      height: 312,
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
            SizedBox(height: 1), // 주증상과 추가 정보 사이 간격
            TextField(
              maxLines: 15, // Set maxLines to null for multiline input
              decoration: InputDecoration(
                  hintText: 'Please Write Main Symptom of the Patient.',
                  hintStyle: TextStyle(
                    color: Color(0xFFAFAFAF),
                    fontSize: 11,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15, // Adjust the vertical padding
                  ),
                  border: InputBorder.none
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 11,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
