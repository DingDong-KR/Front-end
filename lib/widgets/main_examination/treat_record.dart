import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class TreatRecord extends StatefulWidget {
  const TreatRecord({Key? key}) : super(key: key);

  @override
  _TreatRecordState createState() => _TreatRecordState();
}

class _TreatRecordState extends State<TreatRecord> {
  late DateTime _currentTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now(); // 현재 시간으로 초기화
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      // 1분마다 _currentTime 업데이트
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // 위젯이 dispose될 때 타이머 취소
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 207,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '진료기록',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.11,
                  letterSpacing: 0.14,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/icons/icon_document.svg'),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              Text(
                DateFormat('yyyy-MM-dd  HH:mm').format(_currentTime),
                style: const TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.12,
                  letterSpacing: 0.12,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
