import 'package:flutter/material.dart';

class BeddingScreen extends StatelessWidget {
  final int patientNumber;
  const BeddingScreen({Key? key, required this.patientNumber}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue, // 예시로 파란색 배경 적용
      child: Center(
        child: Text(
          'BeddingScreen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
