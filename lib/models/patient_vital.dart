class PatientVitalFields {
  static const String chartNumber = 'chartNumber'; 
  static const String patientNumber = 'patientNumber'; 
  static const String bt = 'bt';                            // 체온
  static const String sbp = 'bp_h';                         // 수축기 혈압
  static const String dbp = 'bp_l';                         // 이완기 혈압
  static const String bloodSugar = 'bloodSugar';            // 혈당
}


class PatientVital {
  static String tableName = 'patientVital';


  final int chartNumber;
  final int patientNumber;
  final double? bt;
  final int? sbp;
  final int? dbp;
  final int? bloodSugar;

  const PatientVital({
    required this.chartNumber,
    required this.patientNumber,
    this.bt,
    this.sbp,
    this.dbp,
    this.bloodSugar,

  });

  Map<String, dynamic> toJson() {
    return {
      PatientVitalFields.chartNumber: chartNumber,
      PatientVitalFields.patientNumber: patientNumber,
      PatientVitalFields.bt: bt,
      PatientVitalFields.sbp: sbp,
      PatientVitalFields.dbp: dbp,
      PatientVitalFields.bloodSugar: bloodSugar,
    };
  }

  factory PatientVital.fromJson(Map<String, dynamic> json) {
    return PatientVital(
      chartNumber: json[PatientVitalFields.chartNumber] as int,
      patientNumber: json[PatientVitalFields.patientNumber] as int,
      bt: json[PatientVitalFields.bt] as double,
      sbp: json[PatientVitalFields.sbp] as int,
      dbp: json[PatientVitalFields.dbp] as int,
      bloodSugar: json[PatientVitalFields.bloodSugar] as int,
    );
  }
}