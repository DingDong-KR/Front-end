import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_desktop_app/controller/pre_examination_controller.dart';

import '../styles/textStyles.dart';

class MainSymptom extends StatelessWidget {
  final int chartNumber;
  final double height;
  final double width;
  MainSymptom({Key? key, required this.chartNumber,required this.height, required this.width}) : super(key: key);

  final PreExaminationController preExaminationController = Get.put(PreExaminationController()); //컨트롤러에 데이터를 집어넣기 때문에 get.put을 써야함.
  final TextEditingController mainSymptomController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
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
              ),
            ),
            SizedBox(height: 1), // 주증상과 추가 정보 사이 간격
            TextField(
              cursorHeight: 8.0,
              controller: mainSymptomController,
              onChanged: (value) {
                // mainSymptom의 값을 변경합니다.
                preExaminationController.updateMainSymptom(value);
                print('저장하는 주증상: ${preExaminationController.mainSymptom.value}');
              },
              maxLines: 15,
              decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Color(0xFFAFAFAF),
                    fontSize: 11,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  border: InputBorder.none
              ),
              style: TextStyles.text11Style.copyWith(height: 1.5), // height 값을 조절해주세요
            ),

          ],
        ),
      ),
    );
  }
}
