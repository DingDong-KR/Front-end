import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_desktop_app/controller/pre_examination_controller.dart';
import 'package:my_desktop_app/styles/textStyles.dart';

class NursingNote extends StatelessWidget {
  final int chartNumber;
  final double height;
  final double width;
  NursingNote(
      {Key? key,
      required this.chartNumber,
      required this.height,
      required this.width})
      : super(key: key);

  final PreExaminationController preExaminationController =
      Get.put(PreExaminationController()); //컨트롤러에 데이
  final TextEditingController nursingNoteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Row 내 자식들을 시작점에 맞추기
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Text(
                  '간호노트',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset('assets/icons/icon_pencil.svg'),
              ],
            ),
          ),
          TextField(
            cursorHeight: 8.0,
            controller: nursingNoteController,
            onChanged: (value) {
              // mainSymptom의 값을 변경합니다.
              preExaminationController.updateNursingNote(value);
              print('저장하는 주증상: ${preExaminationController.nursingNote.value}');
            },
            maxLines: 11,
            decoration: const InputDecoration(
                hintStyle: TextStyle(
                  color: Color(0xFFAFAFAF),
                  fontSize: 11,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                border: InputBorder.none),
            style: TextStyles.text11Style
                .copyWith(height: 1.5), // height 값을 조절해주세요
          ),
        ],
      ),
    );
  }
}
