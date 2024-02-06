import 'package:flutter/material.dart';
import 'package:my_desktop_app/widgets/pre_examination/nursing_note.dart';
import 'package:my_desktop_app/widgets/pre_examination/patient_simple_info.dart';
import '../widgets/pre_examination/main_symptom.dart';
import '../widgets/pre_examination/patient_history.dart';
import '../../models/patient_history_item.dart';
import '../widgets/pre_examination/ros.dart'; // Import PatientHistoryItem model

class PreExaminationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE2F1F6),
      child: Column(
        children: [
          PatientSimpleInfo(),
          Row(
            children: [
              PatientHistory(patientsItems), // Pass patientsItems as argument
              Column(
                children: [
                  Row(
                    children: [
                      Ros(),
                      NusrsingNote(),
                    ],
                  ),
                  MainSymptom(),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
