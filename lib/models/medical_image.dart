class MedicalImageFields {
  static final String imageIndex = 'imageIndex';              // 각 이미지별 index
  static final String chartNumber = 'chartNumber';            // 차트번호
  static final String treatmentArea = 'treatmentArea';        // 사진 부위
  static final String medicalImagePath = 'medicalImagePath';  // 전송하지 않는다고 가정, 해당 기기에 저장된 경로만 따로 저장
}

class MedicalImage {
  static String tableName = 'medicalImage';

  final int imageIndex;
  final int chartNumber;
  final String treatmentArea;
  final String medicalImagePath;

  const MedicalImage({
    required this.imageIndex,
    required this.chartNumber,
    required this.treatmentArea,
    required this.medicalImagePath,
  });

  Map<String, dynamic> toJson() {
    return {
      MedicalImageFields.imageIndex: imageIndex,
      MedicalImageFields.chartNumber: chartNumber,
      MedicalImageFields.treatmentArea: treatmentArea,
      MedicalImageFields.medicalImagePath: medicalImagePath,
    };
  }

  factory MedicalImage.fromJson(Map<String, dynamic> json) {
    return MedicalImage(
      imageIndex: json[MedicalImageFields.imageIndex] as int,
      chartNumber: json[MedicalImageFields.chartNumber] as int,
      treatmentArea: json[MedicalImageFields.treatmentArea] as String,
      medicalImagePath: json[MedicalImageFields.medicalImagePath] as String,
    );
  }
}