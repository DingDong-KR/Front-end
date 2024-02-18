import 'package:flutter/material.dart';
import 'package:my_desktop_app/widgets/pre_examination/nursing_note.dart';
import 'package:my_desktop_app/widgets/patient_simple_info.dart';
import '../widgets/pre_examination/main_symptom.dart';
import '../widgets/medical_history_widget.dart';
import '../widgets/pre_examination/ros.dart'; // Import PatientHistoryItem model

//TODO: 환자리스트에서 선택된 환자의 환자 번호 넘기기, 고유한 차트 번호 생성하기
class PreExaminationScreen extends StatelessWidget {
  final int patientNumber;
  final int? chartNumber;
  const PreExaminationScreen(
      {Key? key, required this.patientNumber, required this.chartNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Chart Number: $chartNumber'); // 이 부분에서 chartNumber를 출력합니다.
    return Container(
      color: const Color(0xFFE2F1F6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(9.0, 9.0, 9.0, 0),
            child: PatientSimpleInfo(
              patientNumber: patientNumber,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(9.0, 3.0, 0.0, 0),
                child: MedicalHistoryWidget(574, patientNumber),
              ), // Pass patientsItems as argument
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3.0, 3.0, 0.0, 0),
                        child: Ros(),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3.0, 3.0, 0.0, 0),
                        child: NusrsingNote(),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3.0, 3.0, 0.0, 0),
                    child: MainSymptom(),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
