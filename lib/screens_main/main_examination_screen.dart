import 'package:flutter/material.dart';
import 'package:my_desktop_app/widgets/main_examination/nursing_note_main.dart';
import 'package:my_desktop_app/widgets/nursing_note.dart';
import 'package:my_desktop_app/widgets/past_history.dart';
import 'package:my_desktop_app/widgets/ros.dart';
import '../widgets/main_examination/diagnosis.dart';
import '../widgets/main_examination/image_section.dart';
import '../widgets/main_examination/order_set.dart';
import '../widgets/main_symptom.dart';
import '../widgets/main_examination/main_symptom_main.dart';
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
      color: const Color(0xFFE2F1F6), // 예시로 파란색 배경 적용
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(3.0, 3.0, 3.0, 3.0),
            child: PatientSimpleInfo(
              patientNumber: patientNumber,
              width: double.infinity,
              height: 38,
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0),
                          child: Ros(
                              chartNumber: chartNumber,
                              width: 158.5,
                              height: 122),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0),
                          child: MainSymptomMain(
                              chartNumber: chartNumber,
                              width: 158.5,
                              height: 122),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(3.0, 3.0, 0, 0),
                      child: PastHistory(
                          chartNumber: chartNumber, width: 320, height: 122),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(3.0, 3.0, 0.0, 0),
                      child: NursingNoteMain(
                          chartNumber: chartNumber, width: 320, height: 122),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(3.0, 3.0, 0.0, 3.0),
                        child: MedicalHistoryWidget(
                          patientNumber: patientNumber,
                          width: 320,
                          height: 370,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
                        child: TreatRecord(
                          chartNumber: chartNumber,
                          width: 400,
                          height: 372,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3.0, 3.0, 0.0, 0.0),
                        child: Diagnosis(
                          chartNumber: chartNumber,
                          width: 400,
                          height: 150,
                        ),
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(3.0, 3.0, 0.0, 3.0),
                          child: Treatment(),
                        ),
                      ),
                    ],
                  ),
                ),
                const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
                      child: ImageSection(),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(3.0, 3.0, 0.0, 3.0),
                        child: OrderSet(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
