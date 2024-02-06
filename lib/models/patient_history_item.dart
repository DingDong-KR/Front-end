import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PatientHistoryItem {
  final DateTime time;
  final String diagnosis; // 환자 순서? 번호?
  final String acupunctureTreatment;
  final String medicine;

  PatientHistoryItem({
    required this.time,
    required this.diagnosis,
    required this.acupunctureTreatment,
    required this.medicine,// Change to DateTime
  });
}

final List<PatientHistoryItem> patientsItems = [
  PatientHistoryItem(
    time: DateTime.parse("1969-07-20 20:18:04Z"),
    diagnosis: "손가락 골절",
    acupunctureTreatment: "약침치료",
    medicine: "가미소요산"
  ),
  PatientHistoryItem(
      time: DateTime.parse("1978-07-20 20:18:04Z"),
      diagnosis: "발가락 골절",
      acupunctureTreatment: "봉침치료",
      medicine: "가미소요산2"
  ),
];
