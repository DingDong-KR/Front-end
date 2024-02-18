import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_desktop_app/controller/main_examination_controller.dart';
import 'package:my_desktop_app/styles/textStyles.dart';

class TreatRecord extends StatefulWidget {
  final int chartNumber;

  const TreatRecord({Key? key, required this.chartNumber}) : super(key: key);

  @override
  _TreatRecordState createState() => _TreatRecordState();
}

class _TreatRecordState extends State<TreatRecord> {
  final MainExaminationController mainExaminationController =
      Get.put(MainExaminationController());

  final TextEditingController trController = TextEditingController();

  late DateTime _currentTime;
  late Timer _timer;
  final TextEditingController _textController = TextEditingController();

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
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 267,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
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
          ),
          SizedBox(height: 30,),
          Stack(
            children: [
              Container(
                width: 375,
                height: 180,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF7F7F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: Color(0xFFAFAFAF),
                        fontSize: 11,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15, // Adjust the vertical padding
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                ),
              ),
            ],
          ),
            -----------------------------------
          TextField(
              controller: trController,
              onChanged: (value) {
                // mainSymptom의 값을 변경합니다.
                mainExaminationController.updateTreatRecord(value);
                print(
                    '저장하는 진료기록: ${mainExaminationController.treatRecord.value}');
              },
              maxLines: 8,
              decoration: const InputDecoration(
                  hintText: '진료기록을 작성해주세요.',
                  hintStyle: TextStyle(
                    color: Color(0xFFAFAFAF),
                    fontSize: 11,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  border: InputBorder.none),
              style: TextStyles.text11Style.copyWith(height: 1.5)),
        ],
      ),
    );
  }
}
