class PreExaminationFields {
  static final String chartNumber = 'chartNumber';          // 차트 번호
  static final String userId = 'userId';                    // 예진 진찰자 ID
  static final String patientNumber = 'patientNumber';      // 환자 번호
  static final String measurementDate = 'measurementDate';  // 진찰 일
  static final String bt = 'bt';                            // 체온
  static final String bp = 'bp';                            // 혈압
  static final String bloodSugar = 'bloodSugar';            // 혈당
  static final String mainSymptoms = 'mainSymptoms';        // 주증상
  static final String rosKeywords = 'rosKeywords';          // 향후 본진에서 출력할 keyword들 ex) #오한
  static final List<String> rosDescriptives = [
    'rosDescriptive1',
    'rosDescriptive2',
  ]; // ros 부분에서의 주관식
  // detail 부분 별도 table에 저장 필요하면 말해주세요!
  static final String ros_detail = 'ros_detail'; // ros 상세 정보 3 차원 배열 사용 구분은 ^(가장 내부) -> ;(중간) -> |(바깥쪽) -> [[[a1,a2],[b1,b2]],[['c1', 'c2'], ['d1', 'd2']]] -> 'a1^a2;b1^b2|c1^c2;d1^d2'
  static final String additionalNotes = 'additionalNotes'; // 추가 정보 -> 간호 노트
  static final String consentToCollectPersonalInformation = 'consentToCollectPersonalInformation'; // 향후 사용 할 수 있는 개인정보 동의서
}
class PreExamination {
  static String tableName = 'preExamination';

  final int? chartNumber;
  final String userId;
  final int patientNumber;
  final DateTime measurementDate;
  final double bt;
  final int bp;
  final int bloodSugar;
  final String mainSymptoms;
  final String rosKeywords;
  final List<String> rosDescriptives;
  final List<List<List<String>>>? ros_detail;
  final String additionalNotes;
  final bool? consentToCollectPersonalInformation;

  const PreExamination({
    this.chartNumber,
    required this.userId,
    required this.patientNumber,
    required this.measurementDate,
    required this.bt,
    required this.bp,
    required this.bloodSugar,
    required this.mainSymptoms,
    required this.rosKeywords,
    required this.rosDescriptives,
    this.ros_detail,
    required this.additionalNotes,
    this.consentToCollectPersonalInformation,
  });

  Map<String, dynamic> toJson() {
    return {
      PreExaminationFields.chartNumber: chartNumber,
      PreExaminationFields.userId: userId,
      PreExaminationFields.patientNumber: patientNumber,
      PreExaminationFields.measurementDate: measurementDate.toIso8601String(),
      PreExaminationFields.bt: bt,
      PreExaminationFields.bp: bp,
      PreExaminationFields.bloodSugar: bloodSugar,
      PreExaminationFields.mainSymptoms: mainSymptoms,
      PreExaminationFields.rosKeywords: rosKeywords,
      for (int i = 0; i < PreExaminationFields.rosDescriptives.length; i++)
        PreExaminationFields.rosDescriptives[i]: rosDescriptives[i],
      PreExaminationFields.ros_detail: ros_detail?.map((detailList2) => detailList2.map((detailList1) => detailList1.join('^')).join(';')).join('|'),
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
      bt: json[PreExaminationFields.bt] as double,
      bp: json[PreExaminationFields.bp] as int,
      bloodSugar: json[PreExaminationFields.bloodSugar] as int,
      mainSymptoms: json[PreExaminationFields.mainSymptoms] as String,
      rosKeywords: json[PreExaminationFields.rosKeywords] as String,
      rosDescriptives: List<String>.generate(
        PreExaminationFields.rosDescriptives.length,
            (i) => json[PreExaminationFields.rosDescriptives[i]] as String,
      ),
      ros_detail: json[PreExaminationFields.ros_detail] == null ? null : (json[PreExaminationFields.ros_detail] as String).split('|').map((detailList2) => detailList2.split(';').map((detailList1) => detailList1.split('^')).toList()).toList(),
      additionalNotes: json[PreExaminationFields.additionalNotes] as String,
      consentToCollectPersonalInformation: json[PreExaminationFields.consentToCollectPersonalInformation] == null ? null : json[PreExaminationFields.consentToCollectPersonalInformation] == 1,
    );
  }
}