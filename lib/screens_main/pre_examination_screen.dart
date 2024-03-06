import 'package:flutter/material.dart';
import 'package:my_desktop_app/widgets/nursing_note.dart';
import 'package:my_desktop_app/widgets/patient_simple_info.dart';
import '../widgets/main_symptom.dart';
import '../widgets/medical_history_widget.dart';
import '../widgets/ros.dart'; // Import PatientHistoryItem model

class PreExaminationScreen extends StatelessWidget {
  final int patientNumber;
  final int chartNumber;
  const PreExaminationScreen(
      {Key? key, required this.patientNumber, required this.chartNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE2F1F6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 0),
            child: MedicalHistoryWidget(
                patientNumber: patientNumber, width: 320, height: 684),
          ), // Pass patientsItems as argument
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(3.0, 3.0, 9.0, 0),
                child: PatientSimpleInfo(
                  patientNumber: patientNumber,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3.0, 3.0, 0.0, 0),
                    child: Ros(
                      chartNumber: chartNumber,
                      width: 470,
                      height: 260,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3.0, 3.0, 0.0, 0),
                    child: NursingNote(
                        chartNumber: chartNumber, width: 470, height: 260),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(3.0, 3.0, 0.0, 0),
                child: MainSymptom(
                    chartNumber: chartNumber, height: 380, width: 943),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
