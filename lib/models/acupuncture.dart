class AcupunctureFields {
  static final String acupunctureIndex = 'acupunctureIndex';  // 각각의 치료 별로 구분 하기 위한 index
  static final String acupunctureType = 'acupunctureType';    // 치료 종류 구분하기 위한 변수 -> ex) 12, 21 이런 식으로 구성예정
  static final String chartNumber = 'chartNumber';            // 치료와 연결된 차트
  static final String treatmentPos1 = 'treatmentPos1';        // 치료 위치 (각 치료 별로 위치를 지정하는 개수가 다름)
  static final String treatmentPos2 = 'treatmentPos2';
  static final String treatmentPos3 = 'treatmentPos3';
  static final String treatmentPos4 = 'treatmentPos4';
}

class Acupuncture {
  static String tableName = 'acupuncture';

  final int acupunctureIndex;
  final int acupunctureType;
  final int chartNumber;
  final String? treatmentPos1;
  final String? treatmentPos2;
  final String? treatmentPos3;
  final String? treatmentPos4;

  const Acupuncture({
    required this.acupunctureIndex,
    required this.acupunctureType,
    required this.chartNumber,
    this.treatmentPos1,
    this.treatmentPos2,
    this.treatmentPos3,
    this.treatmentPos4,
  });

  Map<String, dynamic> toJson() {
    return {
      AcupunctureFields.acupunctureIndex: acupunctureIndex,
      AcupunctureFields.acupunctureType: acupunctureType,
      AcupunctureFields.chartNumber: chartNumber,
      AcupunctureFields.treatmentPos1: treatmentPos1,
      AcupunctureFields.treatmentPos2: treatmentPos2,
      AcupunctureFields.treatmentPos3: treatmentPos3,
      AcupunctureFields.treatmentPos4: treatmentPos4,
    };
  }

  factory Acupuncture.fromJson(Map<String, dynamic> json) {
    return Acupuncture(
      acupunctureIndex: json[AcupunctureFields.acupunctureIndex] as int,
      acupunctureType: json[AcupunctureFields.acupunctureType] as int,
      chartNumber: json[AcupunctureFields.chartNumber] as int,
      treatmentPos1: json[AcupunctureFields.treatmentPos1] as String,
      treatmentPos2: json[AcupunctureFields.treatmentPos2] as String,
      treatmentPos3: json[AcupunctureFields.treatmentPos3] as String?,
      treatmentPos4: json[AcupunctureFields.treatmentPos4] as String?,
    );
  }
}

