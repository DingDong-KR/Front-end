class DiseaseFields {
  static final String diseaseIndex = 'diseaseIndex';                        // 진료된 병을 각각 구분하기 위한 index
  static final String chartNumber = 'chartNumber';                          // 진료된 병명과 연결된 차트
  static final String primarySecondaryDisease = 'primarySecondaryDisease';  // 주/부에 따라 분리 원래 bool이지만 따로 저장이 안되서 int 로 저장됨
  static final String diseaseCode = 'diseaseCode';                          // 병 코드 (주/부 구분하는데 사용되기도 함)
  static final String diseaseName = 'diseaseName';                          // 병 이름 -> 한글 명만 있지만, 상병 검색에서는 영어이름도 포함될 것
}

class Disease {
  static String tableName = 'disease';

  final int diseaseIndex;
  final int chartNumber;
  final bool primarySecondaryDisease;
  final String diseaseCode;
  final String diseaseName;

  const Disease({
    required this.diseaseIndex,
    required this.chartNumber,
    required this.primarySecondaryDisease,
    required this.diseaseCode,
    required this.diseaseName,
  });

  Map<String, dynamic> toJson() {
    return {
      DiseaseFields.diseaseIndex: diseaseIndex,
      DiseaseFields.chartNumber: chartNumber,
      DiseaseFields.primarySecondaryDisease: primarySecondaryDisease ? 1 : 0,  // SQLite does not have a separate Boolean storage class.
      DiseaseFields.diseaseCode: diseaseCode,
      DiseaseFields.diseaseName: diseaseName,
    };
  }

  factory Disease.fromJson(Map<String, dynamic> json) {
    return Disease(
      diseaseIndex: json[DiseaseFields.diseaseIndex] as int,
      chartNumber: json[DiseaseFields.chartNumber] as int,
      primarySecondaryDisease: (json[DiseaseFields.primarySecondaryDisease] as int) == 1,
      diseaseCode: json[DiseaseFields.diseaseCode] as String,
      diseaseName: json[DiseaseFields.diseaseName] as String,
    );
  }
}
