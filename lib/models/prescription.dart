class PrescriptionFields {
  static final String prescriptionIndex = 'prescriptionIndex';        // 처방약 INDEX
  static final String treatmentName = 'treatmentName';                // 처방약 이름
  static final String dosagePerDay = 'dosagePerDay';                  // 1일 투여량
  static final String chartNumber = 'chartNumber';                    // 차트 번호
  static final String durationOfMedication = 'durationOfMedication';  // 복용일수
  static final String totalAmount = 'totalAmount';                    // 총 팩수
}

class Prescription {
  static String tableName = 'prescription';

  final int prescriptionIndex;
  final String treatmentName;
  final int dosagePerDay;
  final int chartNumber;
  final int durationOfMedication;
  final int totalAmount;

  const Prescription({
    required this.prescriptionIndex,
    required this.treatmentName,
    required this.chartNumber,
    required this.dosagePerDay,
    required this.durationOfMedication,
    required this.totalAmount,
  });

  Map<String, dynamic> toJson() {
    return {
      PrescriptionFields.prescriptionIndex: prescriptionIndex,
      PrescriptionFields.treatmentName: treatmentName,
      PrescriptionFields.dosagePerDay: dosagePerDay,
      PrescriptionFields.chartNumber: chartNumber,
      PrescriptionFields.durationOfMedication: durationOfMedication,
      PrescriptionFields.totalAmount: totalAmount,
    };
  }

  factory Prescription.fromJson(Map<String, dynamic> json) {
    return Prescription(
      prescriptionIndex: json[PrescriptionFields.prescriptionIndex] as int,
      treatmentName: json[PrescriptionFields.treatmentName] as String,
      dosagePerDay: json[PrescriptionFields.dosagePerDay] as int,
      chartNumber: json[PrescriptionFields.chartNumber] as int,
      durationOfMedication: json[PrescriptionFields.durationOfMedication] as int,
      totalAmount: json[PrescriptionFields.totalAmount] as int,
    );
  }
}
