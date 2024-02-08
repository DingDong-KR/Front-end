class MedicalRecordFields {
  static final String chartNumber = 'chartNumber';      // 차트 번호 진료 기록은 하나뿐이라 PRIMARY KEY로 사용함
  static final String userId = 'userId';                // 이 진료 기록 작성하는 작성자 id
  static final String medicalRecord = 'medicalRecord';  // 진료 기록
}

class MedicalRecord {
  static String tableName = 'medicalRecord';

  final int chartNumber;
  final String userId;
  final String medicalRecord;

  const MedicalRecord({
    required this.chartNumber,
    required this.userId,
    required this.medicalRecord,
  });

  Map<String, dynamic> toJson() {
    return {
      MedicalRecordFields.chartNumber: chartNumber,
      MedicalRecordFields.userId: userId,
      MedicalRecordFields.medicalRecord: medicalRecord,
    };
  }

  factory MedicalRecord.fromJson(Map<String, dynamic> json) {
    return MedicalRecord(
      chartNumber: json[MedicalRecordFields.chartNumber] as int,
      userId: json[MedicalRecordFields.userId] as String,
      medicalRecord: json[MedicalRecordFields.medicalRecord] as String,
    );
  }
}