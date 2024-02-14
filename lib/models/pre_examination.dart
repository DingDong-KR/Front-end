class PreExaminationFields {
  static final String chartNumber = 'chartNumber';          // 차트 번호
  static final String userId = 'userId';                    // 예진 진찰자 ID
  static final String patientNumber = 'patientNumber';      // 환자 번호
  static final String measurementDate = 'measurementDate';  // 진찰 일
  static final String bt = 'bt';                            // 체온
  static final String bp_h = 'bp_h';
  static final String bp_l = 'bp_l';                           // 혈압
  static final String bloodSugar = 'bloodSugar';            // 혈당
  static final String mainSymptoms = 'mainSymptoms';        // 주증상
  static final String rosKeywords = 'rosKeywords';          // 향후 본진에서 출력할 keyword들 ex) #오한
  static final List<String> rosDescriptives = [
    'rosDescriptive1',
    'rosDescriptive2',
  ]; // ros 부분에서의 주관식
  static final String bodyType = 'bodyType';
  static final String ros_detail = 'ros_detail'; // ros 상세 정보 3 차원 배열 사용 구분은 ^(가장 내부) -> ;(중간) -> |(바깥쪽) -> [[[a1,a2],[b1,b2]],[['c1', 'c2'], ['d1', 'd2']]] -> 'a1^a2;b1^b2|c1^c2;d1^d2'
  static final String additionalNotes = 'additionalNotes'; // 추가 정보 -> 간호 노트
  static final String consentToCollectPersonalInformation = 'consentToCollectPersonalInformation'; // 향후 사용 할 수 있는 개인정보 동의서
  static final String queue = 'queue'; // 대기열
  static final String state = 'state'; // 상태
}
class PreExamination {
  static String tableName = 'preExamination';

  final int? chartNumber;
  final String userId;
  final int patientNumber;
  final DateTime measurementDate;
  final double? bt;
  final int? bp_h;
  final int? bp_l;
  final int? bloodSugar;
  final String? mainSymptoms;
  final String? rosKeywords;
  final List<String>? rosDescriptives;
  final int? bodyType;
  final List<List<List<String>>>? ros_detail;
  final String? additionalNotes;
  final bool? consentToCollectPersonalInformation;
  final int? queue;
  final String? state;

  const PreExamination({
    this.chartNumber,
    required this.userId,
    required this.patientNumber,
    required this.measurementDate,
    this.bt,
    this.bp_h,
    this.bp_l,
    this.bloodSugar,
    this.mainSymptoms,
    this.rosKeywords,
    this.rosDescriptives,
    this.bodyType,
    this.ros_detail,
    this.additionalNotes,
    this.consentToCollectPersonalInformation,
    this.queue,
    this.state,

  });

  Map<String, dynamic> toJson() {
    return {
      PreExaminationFields.chartNumber: chartNumber,
      PreExaminationFields.userId: userId,
      PreExaminationFields.patientNumber: patientNumber,
      PreExaminationFields.measurementDate: measurementDate.toIso8601String(),
      PreExaminationFields.bt: bt,
      PreExaminationFields.bp_h: bp_h,
      PreExaminationFields.bp_l: bp_l,
      PreExaminationFields.bloodSugar: bloodSugar,
      PreExaminationFields.mainSymptoms: mainSymptoms,
      PreExaminationFields.rosKeywords: rosKeywords,
      for (int i = 0; i < PreExaminationFields.rosDescriptives.length; i++)
        PreExaminationFields.rosDescriptives[i]: rosDescriptives?[i],
      PreExaminationFields.bodyType: bodyType,
      PreExaminationFields.ros_detail: ros_detail?.map((detailList2) => detailList2.map((detailList1) => detailList1.join('^')).join(';')).join('|'),
      PreExaminationFields.additionalNotes: additionalNotes,
      PreExaminationFields.consentToCollectPersonalInformation: consentToCollectPersonalInformation == null ? null : (consentToCollectPersonalInformation! ? 1 : 0),
      PreExaminationFields.queue: queue,
      PreExaminationFields.state: state,
    };
  }

  factory PreExamination.fromJson(Map<String, dynamic> json) {
    return PreExamination(
      chartNumber: json[PreExaminationFields.chartNumber] as int?,
      userId: json[PreExaminationFields.userId] as String,
      patientNumber: json[PreExaminationFields.patientNumber] as int,
      measurementDate: DateTime.parse(json[PreExaminationFields.measurementDate] as String),
      bt: json[PreExaminationFields.bt] as double,
      bp_h: json[PreExaminationFields.bp_h] as int,
      bp_l: json[PreExaminationFields.bp_l] as int,
      bloodSugar: json[PreExaminationFields.bloodSugar] as int,
      mainSymptoms: json[PreExaminationFields.mainSymptoms] as String,
      rosKeywords: json[PreExaminationFields.rosKeywords] as String,
      rosDescriptives: List<String>.generate(
        PreExaminationFields.rosDescriptives.length,
            (i) => json[PreExaminationFields.rosDescriptives[i]] as String,
      ),
      bodyType: json[PreExaminationFields.bodyType] as int,
      ros_detail: json[PreExaminationFields.ros_detail] == null ? null : (json[PreExaminationFields.ros_detail] as String).split('|').map((detailList2) => detailList2.split(';').map((detailList1) => detailList1.split('^')).toList()).toList(),
      additionalNotes: json[PreExaminationFields.additionalNotes] as String,
      consentToCollectPersonalInformation: json[PreExaminationFields.consentToCollectPersonalInformation] == null ? null : json[PreExaminationFields.consentToCollectPersonalInformation] == 1,
      queue: json[PreExaminationFields.queue] as int,
      state: json[PreExaminationFields.state] as String,
    );
  }
}