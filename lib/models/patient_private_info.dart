class PatientPrivateInfoFields {
  static final String patientNumber = 'patientNumber'; // 환자 번호
  static final String name = 'name'; // 환자 이름
  static final String gender = 'gender'; // 환자 성별
  static final String age = 'age'; // 환자 연령
  static final String socialSecurityNumber = 'socialSecurityNumber'; // 환자 주민번호
  static final String birthDate = 'birthDate'; // 환자 생년월일
  static final String address = 'address'; // 환자 주소
   
}

class PatientPrivateInfo {
  static String tableName = 'patientPrivateInfo';

  final int? patientNumber;
  final String name;
  final String gender;
  final int age;
  final String socialSecurityNumber;
  final String birthDate;
  final String address; // 없어서 추가했음

  PatientPrivateInfo({
    this.patientNumber,
    required this.name,
    required this.gender,
    required this.age,
    required this.socialSecurityNumber,
    required this.birthDate,
    required this.address, // 추가함

  });

  Map<String, dynamic> toJson() {
    return {
      PatientPrivateInfoFields.patientNumber: patientNumber,
      PatientPrivateInfoFields.name: name,
      PatientPrivateInfoFields.gender: gender,
      PatientPrivateInfoFields.age: age,
      PatientPrivateInfoFields.socialSecurityNumber: socialSecurityNumber,
      PatientPrivateInfoFields.birthDate: birthDate,
      PatientPrivateInfoFields.address: address, // 추가함
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
    );
  }
}
