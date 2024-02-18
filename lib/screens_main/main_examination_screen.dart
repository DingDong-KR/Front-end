import 'package:flutter/material.dart';
import 'package:my_desktop_app/widgets/nursing_note.dart';
import 'package:my_desktop_app/widgets/ros.dart';
import '../widgets/main_examination/diagnosis.dart';
import '../widgets/main_examination/image_section.dart';
import '../widgets/main_examination/order_set.dart';
import '../widgets/main_symptom.dart';
import '../widgets/main_symptom_main.dart';
import '../widgets/medical_history_widget.dart';
import '../widgets/main_examination/treat_record.dart';
import '../widgets/main_examination/treatment.dart';
import '../widgets/patient_simple_info.dart';

class MainExaminationScreen extends StatelessWidget {
  final int patientNumber;
  final int chartNumber;
  const MainExaminationScreen(
      {Key? key, required this.patientNumber, required this.chartNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE2F1F6), // 예시로 파란색 배경 적용
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(9.0, 9.0, 9.0, 0),
            child: PatientSimpleInfo(
              patientNumber: patientNumber,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(9.0, 3.0, 0.0, 0),
                        child: Ros(chartNumber: chartNumber, width: 132, height: 142),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(3.0, 3.0, 0.0, 0),
                        child: MainSymptomMain(chartNumber: chartNumber, width: 132,height: 142,),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(9.0, 3.0, 0.0, 0),
                    child: NursingNote(chartNumber: chartNumber, width:268, height:122),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(9.0, 3.0, 0.0, 0),
                    child: MedicalHistoryWidget(patientNumber:patientNumber, width:268, height: 370,),
                  ),
                ],
              ),
              const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(3.0, 3.0, 0.0, 0.0),
                    child: TreatRecord(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(3.0, 3.0, 0.0, 0.0),
                    child: Diagnosis(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(3.0, 3.0, 0.0, 0.0),
                    child: Treatment(),
                  ),
                ],
              ),
              const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(3.0, 3.0, 0.0, 0.0),
                    child: ImageSection(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(3.0, 3.0, 0.0, 0.0),
                    child: OrderSet(),
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
