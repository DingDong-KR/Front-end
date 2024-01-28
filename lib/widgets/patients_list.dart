import 'package:flutter/material.dart';

class PatientsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: 244,
        decoration: BoxDecoration(color: Color(0xFFF7F7F7)),
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.all(13.0),
              child: Text(
                '환자리스트',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            )
            // Your list items...
          ],
        ),
      ),
    );
  }
}