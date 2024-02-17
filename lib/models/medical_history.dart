class MedicalHistoryFields {
  static const String patientNumber = 'patientNumber'; // 환자 번호
  static const String chartNumber = 'chartNumber';
  static const String visiteDate = 'visiteDate'; // 방문날짜
  static const String diagnosis = 'diagnosis'; // 진단명
  static const String acupunctureTreat = 'acupunctureTreat'; // 침구치료
  static const String medicine = 'medicine'; // 방약
}

class MedicalHistory {
  static String tableName = 'medicalHistory';

  final int patientNumber;
  final int chartNumber;
  final String visiteDate;
  final String diagnosis;
  final String? acupunctureTreat;
  final String? medicine;

  MedicalHistory({
    required this.patientNumber,
    required this.chartNumber,
    required this.visiteDate,
    required this.diagnosis,
    this.acupunctureTreat,
    this.medicine,
  });

  Map<String, dynamic> toJson() {
    return {
      MedicalHistoryFields.patientNumber: patientNumber,
      MedicalHistoryFields.chartNumber: chartNumber,
      MedicalHistoryFields.visiteDate: visiteDate,
      MedicalHistoryFields.diagnosis: diagnosis,
      MedicalHistoryFields.acupunctureTreat: acupunctureTreat,
      MedicalHistoryFields.medicine: medicine,
    };
  }

  factory MedicalHistory.fromJson(Map<String, dynamic> json) {
    return MedicalHistory(
      patientNumber: json[MedicalHistoryFields.patientNumber] as int,
      chartNumber: json[MedicalHistoryFields.chartNumber] as int,
      visiteDate: json[MedicalHistoryFields.visiteDate] as String,
      diagnosis: json[MedicalHistoryFields.diagnosis] as String,
      acupunctureTreat: json[MedicalHistoryFields.acupunctureTreat] as String,
      medicine: json[MedicalHistoryFields.medicine] as String,

    );
  }
}
