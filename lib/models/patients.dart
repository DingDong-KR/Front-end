class PatientFields {
  static const String patientNumber = 'patientNumber'; // 환자 번호
  static const String name = 'name'; // 환자 이름
  static const String gender = 'gender'; // 환자 성별
  static const String age = 'age'; // 환자 연령
  static const String socialSecurityNumber = 'socialSecurityNumber'; // 환자 주민번호
  static const String address = 'address'; // 환자 주소
  static const String lastVisitDate =
      'lastVisitDate'; // 환자 최근 방문 날 -> 추후 예진 차트 작성시 입력되게 할 것임
  static const String queue = 'queue'; // 대기열
}

class Patient {
  static String tableName = 'patient';

  final int? patientNumber;
  final String name;
  final String gender;
  final int age;
  final int socialSecurityNumber;
  final String address; // 없어서 추가했음
  DateTime? lastVisitDate; // 이후에 수정해야 함
  int? queue;

  Patient({
    this.patientNumber,
    required this.name,
    required this.gender,
    required this.age,
    required this.socialSecurityNumber,
    required this.address, // 추가함
    this.lastVisitDate,
    this.queue,
  });

  Map<String, dynamic> toJson() {
    return {
      PatientFields.patientNumber: patientNumber,
      PatientFields.name: name,
      PatientFields.gender: gender,
      PatientFields.age: age,
      PatientFields.socialSecurityNumber: socialSecurityNumber,
      PatientFields.address: address, // 추가함
      PatientFields.lastVisitDate: lastVisitDate?.toIso8601String(),
      PatientFields.queue: queue, // 대기열 하나씩 증가하게하는거 구현필요
    };
  }

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      patientNumber: json[PatientFields.patientNumber] as int,
      name: json[PatientFields.name] as String,
      gender: json[PatientFields.gender] as String,
      age: json[PatientFields.age] as int,
      socialSecurityNumber: json[PatientFields.socialSecurityNumber] as int,
      address: json[PatientFields.address] as String,
      lastVisitDate: json[PatientFields.lastVisitDate] != null
          ? DateTime.parse(json[PatientFields.lastVisitDate] as String)
          : null,
      queue: json[PatientFields.queue] as int,
    );
  }
}
