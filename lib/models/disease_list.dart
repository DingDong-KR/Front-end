class DiseaseListFields {
  static final String diseaseCode = 'classificationCode';
  static final String koreanName = 'koreanName';
  static final String englishName = 'englishName';
  static final String completeness = 'completeness';
}

// DiseaseList 모델
class DiseaseList {
  static String tableName = 'diseaseList';

  final String diseaseCode;
  final String koreanName;
  final String englishName;
  final String completeness;

  DiseaseList({
    required this.diseaseCode,
    required this.koreanName,
    required this.englishName,
    required this.completeness,
  });
  Map<String, dynamic> toJson() {
    return {
      DiseaseListFields.diseaseCode: diseaseCode,
      DiseaseListFields.koreanName: koreanName,
      DiseaseListFields.englishName: englishName,
      DiseaseListFields.completeness: completeness
    };
  }
  factory DiseaseList.fromJson(Map<String, dynamic> json) {
    return DiseaseList(
        diseaseCode: json[DiseaseListFields.diseaseCode] as String,
        koreanName: json[DiseaseListFields.koreanName] as String,
        englishName: json[DiseaseListFields.englishName] as String,
        completeness: json[DiseaseListFields.completeness] as String
    );
  }
}

