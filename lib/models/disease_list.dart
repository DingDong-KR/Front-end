class DiseaseListFields {
  static final String diseaseListIndex = 'diseaseListIndex';
  static final String diseaseCode = 'diseaseCode';
  static final String koreanName = 'koreanName';
  static final String englishName = 'englishName';
  static final String completeness = 'completeness';
}

// DiseaseList 모델
class DiseaseList {
  static String tableName = 'diseaseList';

  final int? diseaseListIndex;
  final String diseaseCode;
  final String koreanName;
  final String englishName;
  final String completeness;

  DiseaseList({
    this.diseaseListIndex,
    required this.diseaseCode,
    required this.koreanName,
    required this.englishName,
    required this.completeness,
  });
  Map<String, dynamic> toJson() {
    return {
      DiseaseListFields.diseaseListIndex: diseaseListIndex,
      DiseaseListFields.diseaseCode: diseaseCode,
      DiseaseListFields.koreanName: koreanName,
      DiseaseListFields.englishName: englishName,
      DiseaseListFields.completeness: completeness
    };
  }
  factory DiseaseList.fromJson(Map<String, dynamic> json) {
    return DiseaseList(
        diseaseListIndex: json[DiseaseListFields.diseaseListIndex] as int,
        diseaseCode: json[DiseaseListFields.diseaseCode] as String,
        koreanName: json[DiseaseListFields.koreanName] as String,
        englishName: json[DiseaseListFields.englishName] as String,
        completeness: json[DiseaseListFields.completeness] as String
    );
  }
}
