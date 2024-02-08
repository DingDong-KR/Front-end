import 'package:flutter/material.dart';

import '../models/patient_history_item.dart';
import '../widgets/main_examination/diagnosis.dart';
import '../widgets/main_examination/image_section.dart';
import '../widgets/main_examination/main_symptom.dart';
import '../widgets/main_examination/nursing_note.dart';
import '../widgets/main_examination/order_set.dart';
import '../widgets/main_examination/patient_history.dart';
import '../widgets/main_examination/patient_simple_info.dart';
import '../widgets/main_examination/ros.dart';
import '../widgets/main_examination/treat_record.dart';
import '../widgets/main_examination/treatment.dart';

class MainExaminationScreen extends StatelessWidget {
  const MainExaminationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE2F1F6), // 예시로 파란색 배경 적용
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(9.0, 9.0, 9.0, 0),
            child: PatientSimpleInfo(),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(9.0, 3.0, 0.0, 0),
                        child: Ros(),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(3.0, 3.0, 0.0, 0),
                        child: MainSymptom(),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(9.0, 3.0, 0.0, 0),
                    child: NusrsingNote(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(9.0, 3.0, 0.0, 0),
                    child: PatientHistory(patientsItems),
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
