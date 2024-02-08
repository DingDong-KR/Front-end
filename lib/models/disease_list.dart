class DiseaseListFields {
  static final String diseaseCode = 'classificationCode';
  static final String koreanName = 'koreanName';
  static final String englishName = 'englishName';
}

// DiseaseList 모델
class DiseaseList {
  static String tableName = 'diseaseList';

  final String diseaseCode;
  final String koreanName;
  final String englishName;

  DiseaseList({
    required this.diseaseCode,
    required this.koreanName,
    required this.englishName,
  });
  Map<String, dynamic> toJson() {
    return {
      DiseaseListFields.diseaseCode: diseaseCode,
      DiseaseListFields.koreanName: koreanName,
      DiseaseListFields.englishName: englishName,
    };
  }
  factory DiseaseList.fromJson(Map<String, dynamic> json) {
    return DiseaseList(
        diseaseCode: json[DiseaseListFields.diseaseCode] as String,
        koreanName: json[DiseaseListFields.koreanName] as String,
        englishName: json[DiseaseListFields.englishName] as String
    );
  }
}

