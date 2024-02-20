import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_desktop_app/controller/pre_examination_controller.dart';
import 'package:my_desktop_app/repository/chart_crud_sql.dart';

import '../models/pre_examination.dart';
import '../styles/textStyles.dart';

class MainSymptomMain extends StatelessWidget {
  final int chartNumber;
  final double height;
  final double width;
  MainSymptomMain(
      {Key? key,
      required this.chartNumber,
      required this.height,
      required this.width})
      : super(key: key);

  final PreExaminationController preExaminationController =
      Get.put(PreExaminationController());
  final TextEditingController mainSymptomController = TextEditingController();

  Future<void> loadPre(chartNumber) async {
    // TODO: 예진완료 버튼을 안누르면 여기서 튕김. 예진완료 버튼을 눌러주세요! 알림 팝업 필요.
    if (chartNumber != 0) {
      final PreExaminationProvider preExaminationProvider =
          PreExaminationProvider();
      PreExamination preExamination =
          await preExaminationProvider.getPreExamination(chartNumber);
      print(preExamination.toJson());
    }
  }

  String? mainsymptom;
  Future<void> loadMainSymptom(chartNumber) async {
    if (chartNumber != 0) {
      final PreExaminationProvider preExaminationProvider =
          PreExaminationProvider();
      mainsymptom = await preExaminationProvider.getMainSymptom(chartNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    loadPre(chartNumber); // loadMainSymptom을 호출하여 mainsymptom을 업데이트
    return Container(
      width: width,
      height: height,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(5)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '주증상',
              style: TextStyle(
                color: Color(0xFF404855),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 1),
            Obx(() => Text(preExaminationController.mainSymptom.value,
                style: TextStyles.text11Style.copyWith(height: 1.5))),
          ],
        ),
      ),
    );
  }
}
