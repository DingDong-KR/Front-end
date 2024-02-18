class PreExaminationFields {
  static final String chartNumber = 'chartNumber';          // 차트 번호
  static final String userId = 'userId';                    // 예진 진찰자 ID
  static final String patientNumber = 'patientNumber';      // 환자 번호
  static final String measurementDate = 'measurementDate';  // 진찰 일
  static final String mainSymptoms = 'mainSymptoms';        // 주증상
  static final String rosKeywords = 'rosKeywords';          // 향후 본진에서 출력할 keyword들 ex) #오한
  static final String rosDescriptive = 'rosDescriptive1'; // ros 부분에서의 주관식
  static final String bodyType = 'bodyType';
  static final String additionalNotes = 'additionalNotes'; // 추가 정보 -> 간호 노트
  static final String consentToCollectPersonalInformation = 'consentToCollectPersonalInformation'; // 향후 사용 할 수 있는 개인정보 동의서
}
class PreExamination {
  static String tableName = 'preExamination';

  final int? chartNumber;
  final String userId;
  final int patientNumber;
  final DateTime measurementDate;
  final String? mainSymptoms;
  final String? rosKeywords;
  final String? rosDescriptive;
  final int? bodyType;
  final String? additionalNotes;
  final bool? consentToCollectPersonalInformation;

  const PreExamination({
    this.chartNumber,
    required this.userId,
    required this.patientNumber,
    required this.measurementDate,
    this.mainSymptoms,
    this.rosKeywords,
    this.rosDescriptive,
    this.bodyType,
    this.additionalNotes,
    this.consentToCollectPersonalInformation,

  });

  Map<String, dynamic> toJson() {
    return {
      PreExaminationFields.chartNumber: chartNumber,
      PreExaminationFields.userId: userId,
      PreExaminationFields.patientNumber: patientNumber,
      PreExaminationFields.measurementDate: measurementDate.toIso8601String(),
      PreExaminationFields.mainSymptoms: mainSymptoms,
      PreExaminationFields.rosKeywords: rosKeywords,
      PreExaminationFields.rosDescriptive: rosDescriptive,
      PreExaminationFields.bodyType: bodyType,
      PreExaminationFields.additionalNotes: additionalNotes,
      PreExaminationFields.consentToCollectPersonalInformation: consentToCollectPersonalInformation == null ? null : (consentToCollectPersonalInformation! ? 1 : 0),
    };
  }

  factory PreExamination.fromJson(Map<String, dynamic> json) {
    return PreExamination(
      chartNumber: json[PreExaminationFields.chartNumber] as int?,
      userId: json[PreExaminationFields.userId] as String,
      patientNumber: json[PreExaminationFields.patientNumber] as int,
      measurementDate: DateTime.parse(json[PreExaminationFields.measurementDate] as String),
      mainSymptoms: json[PreExaminationFields.mainSymptoms] as String?,
      rosKeywords: json[PreExaminationFields.rosKeywords] as String?,
      rosDescriptive: json[PreExaminationFields.rosDescriptive] as String?,
      bodyType: json[PreExaminationFields.bodyType] as int?,
      additionalNotes: json[PreExaminationFields.additionalNotes] as String?,
      consentToCollectPersonalInformation: json[PreExaminationFields.consentToCollectPersonalInformation] == null ? null : json[PreExaminationFields.consentToCollectPersonalInformation] == 1,
    );
  }

}