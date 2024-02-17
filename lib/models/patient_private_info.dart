class PatientPrivateInfoFields {
  static const String patientNumber = 'patientNumber'; // 환자 번호
  static const String name = 'name'; // 환자 이름
  static const String gender = 'gender'; // 환자 성별
  static const String age = 'age'; // 환자 연령
  static const String socialSecurityNumber = 'socialSecurityNumber'; // 환자 주민번호
  static const String birthDate = 'birthDate'; // 환자 생년월일
  static const String address = 'address'; // 환자 주소
  static const String affiliation = 'affiliation'; // 방문한 동아리(기관명)
}

class PatientPrivateInfo {
  static String tableName = 'patientPrivateInfo';

  final int? patientNumber;
  final String name;
  final String gender;
  final int age;
  final String socialSecurityNumber;
  final String birthDate;
  final String address;
  final String affiliation;

  PatientPrivateInfo({
    this.patientNumber,
    required this.name,
    required this.gender,
    required this.age,
    required this.socialSecurityNumber,
    required this.birthDate,
    required this.address,
    required this.affiliation,
  });

  Map<String, dynamic> toJson() {
    return {
      PatientPrivateInfoFields.patientNumber: patientNumber,
      PatientPrivateInfoFields.name: name,
      PatientPrivateInfoFields.gender: gender,
      PatientPrivateInfoFields.age: age,
      PatientPrivateInfoFields.socialSecurityNumber: socialSecurityNumber,
      PatientPrivateInfoFields.birthDate: birthDate,
      PatientPrivateInfoFields.address: address,
      PatientPrivateInfoFields.affiliation: affiliation,
    };
  }

  factory PatientPrivateInfo.fromJson(Map<String, dynamic> json) {
    return PatientPrivateInfo(
      patientNumber: json[PatientPrivateInfoFields.patientNumber] as int,
      name: json[PatientPrivateInfoFields.name] as String,
      gender: json[PatientPrivateInfoFields.gender] as String,
      age: json[PatientPrivateInfoFields.age] as int,
      socialSecurityNumber: json[PatientPrivateInfoFields.socialSecurityNumber] as String,
      birthDate: json[PatientPrivateInfoFields.birthDate] as String,
      address: json[PatientPrivateInfoFields.address] as String,
      affiliation: json[PatientPrivateInfoFields.affiliation] as String,
    );
  }
}
