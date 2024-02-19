import 'dart:collection';

import '../models/medical_history.dart';
import '../models/patient_private_info.dart';
import '../models/pre_examination.dart';
import '../models/acupuncture.dart';
import '../models/disease.dart';
import '../models/medical_image.dart';
import '../models/medical_record.dart';
import '../models/patient_queue.dart';
import '../models/patient_vital.dart';
import '../models/ros.dart';
import '../models/prescription.dart';
import '../models/user.dart';
import '../models/disease_list.dart';
import '../models/user_affiliation.dart';
import '../repository/chart_sql_db.dart';

class UserProvider {
  // User 생성
  Future<int> insertUser(User user) async {
    final db = await SqlDataBase.instance.database;
    return await db.insert(User.tableName, user.toJson());
  }

  // 전체 유저 목록 불러오기
  Future<List<User>> getUsers() async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(User.tableName);
    return result.map((json) => User.fromJson(json)).toList();
  }

  // id 로 유저 정보 불러오기
  Future<User> getUser(String userId) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      User.tableName,
      where: "${UserFields.userId} = ?",
      whereArgs: [userId],
    );
    return result.map((json) => User.fromJson(json)).first;
  }

  // 유저 정보 수정 with user 객체
  Future<int> updateUser(User user) async {
    final db = await SqlDataBase.instance.database;
    return await db.update(
      User.tableName,
      user.toJson(),
      where: "${UserFields.userId} = ?",
      whereArgs: [user.userId],
    );
  }

  // 유저 제거
  Future<int> deleteUser(String userId) async {
    final db = await SqlDataBase.instance.database;
    return await db.delete(
      User.tableName,
      where: "${UserFields.userId} = ?",
      whereArgs: [userId],
    );
  }
}

class UserAffiliationProvider {
  // 유저 소속정보 생성
  Future<int> insertUserAffiliation(UserAffiliation userAffiliation) async {
    final db = await SqlDataBase.instance.database;
    return await db.insert(UserAffiliation.tableName, userAffiliation.toJson());
  }

  // 유저-소속 목록 불러오기
  Future<List<UserAffiliation>> getUserAffiliations() async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(UserAffiliation.tableName);
    return result.map((json) => UserAffiliation.fromJson(json)).toList();
  }

  // 유저 소속 가져오기
  Future<List<UserAffiliation>> getAffiliationUsers(String userId) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      UserAffiliation.tableName,
      where: "${UserAffiliationFields.userId} = ?",
      whereArgs: [userId],
    );
    return result.map((json) => UserAffiliation.fromJson(json)).toList();
  }

  // 특정 소속 유저 목록 불러오기
  Future<List<UserAffiliation>> getUserAffiliation(String affiliation) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      UserAffiliation.tableName,
      where: "${UserAffiliationFields.affiliation} = ?",
      whereArgs: [affiliation],
    );
    return result.map((json) => UserAffiliation.fromJson(json)).toList();
  }

  // 유저-소속 수정
  Future<int> updateUserAffiliation(UserAffiliation userAffiliation) async {
    final db = await SqlDataBase.instance.database;
    return await db.update(
      UserAffiliation.tableName,
      userAffiliation.toJson(),
      where: "${UserAffiliationFields.userAffiliationsId} = ?",
      whereArgs: [userAffiliation.userAffiliationsId],
    );
  }

  // 유저-소속 제거
  Future<int> deleteUserAffiliation(int userAffiliationsId) async {
    final db = await SqlDataBase.instance.database;
    return await db.delete(
      UserAffiliation.tableName,
      where: "${UserAffiliationFields.userAffiliationsId} = ?",
      whereArgs: [userAffiliationsId],
    );
  }
}

class PatientProvider {
  // Patient 생성
  Future<int> insertPatient(PatientPrivateInfo patientPrivateInfo) async {
    final db = await SqlDataBase.instance.database;
    return await db.insert(
        PatientPrivateInfo.tableName, patientPrivateInfo.toJson());
  }

  // Patient 목록 조회
  Future<List<PatientPrivateInfo>> getPatients() async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(PatientPrivateInfo.tableName);
    return result.map((json) => PatientPrivateInfo.fromJson(json)).toList();
  }

  // 관련 환자 리스트
  Future<List<PatientPrivateInfo>> getPatientByKeyword(String keyword) async {
    if (keyword.isEmpty) {
      return [ ];
    }
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      PatientPrivateInfo.tableName,
      where: "${PatientPrivateInfoFields.name} LIKE ? OR CAST(${PatientPrivateInfoFields.patientNumber} AS TEXT) LIKE ?",
      whereArgs: ['%$keyword%', '%$keyword%'],
    );
    return result.map((json) => PatientPrivateInfo.fromJson(json)).toList();
  }

  Future<List<PatientPrivateInfo>> getPatientsByAffiliation(
      String affiliation) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      PatientPrivateInfo.tableName,
      where: 'affiliation = ?',
      whereArgs: [affiliation],
    );
    return result.map((json) => PatientPrivateInfo.fromJson(json)).toList();
  }

  // Patient 상세 조회 (주민번호 기반)
  Future<PatientPrivateInfo> getPatient(String socialSecurityNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      PatientPrivateInfo.tableName,
      where: "${PatientPrivateInfoFields.socialSecurityNumber} = ?",
      whereArgs: [socialSecurityNumber],
    );
    return result.map((json) => PatientPrivateInfo.fromJson(json)).first;
  }

  Future<PatientPrivateInfo> getPatientByPatientNum(int patientNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      PatientPrivateInfo.tableName,
      where: "${PatientPrivateInfoFields.patientNumber} = ?",
      whereArgs: [patientNumber],
    );
    return result.map((json) => PatientPrivateInfo.fromJson(json)).first;
  }

// 수정, 삭제 -> user  권한 정한 후 만들 예정
}

class PreExaminationProvider {
  // 예진 chart 생성
  Future<int> insertPreExamination(PreExamination preExamination) async {
    final db = await SqlDataBase.instance.database;
    var modifiedPreExamination = PreExamination(
      chartNumber: preExamination.chartNumber,
      userId: preExamination.userId,
      patientNumber: preExamination.patientNumber,
      measurementDate: DateTime.now(), // 현재 날짜를 사용
      mainSymptoms: preExamination.mainSymptoms,
      // rosKeywords: preExamination.rosKeywords,
      // bodyType: preExamination.bodyType,
      // additionalNotes: preExamination.additionalNotes,
      // consentToCollectPersonalInformation:
      //     preExamination.consentToCollectPersonalInformation,
    );

    return await db.insert(
        PreExamination.tableName, modifiedPreExamination.toJson());
  }

  // 특정 환자 예진 chart 목록 불러오기
  Future<List<PreExamination>> getPreExaminations(int patientNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      PreExamination.tableName,
      where: "${PreExaminationFields.patientNumber} = ?",
      whereArgs: [patientNumber],
    );
    return result.map((json) => PreExamination.fromJson(json)).toList();
  }

  // chart번호로 예진차트 가져오기
  Future<PreExamination> getPreExamination(int chartNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      PreExamination.tableName,
      where: "${PreExaminationFields.chartNumber} = ?",
      whereArgs: [chartNumber],
    );
    return result.map((json) => PreExamination.fromJson(json)).first;
  }

  Future<String?> getMainSymptom(int chartNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      PreExamination.tableName,
      where: "${PreExaminationFields.chartNumber} = ?",
      whereArgs: [chartNumber],
    );

    if (result.isNotEmpty) {
      final preExamination = PreExamination.fromJson(result.first);
      return preExamination.mainSymptoms;
    } else {
      return null;
    }
  }


  // 날짜별 내원 환자 명수 -> YYYY-MM-DD 형식으로 입력해야 함
  Future<int> countByDate(String targetDate) async {
    final db = await SqlDataBase.instance.database;

    final result = await db.query(
      PreExamination.tableName,
      where: "DATE(${PreExaminationFields.measurementDate}) = ?",
      whereArgs: [targetDate],
    );

    return result.length;
  }

  Future<int> getLargestPreChartNumber() async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      PreExamination.tableName,
      orderBy: 'chartNumber DESC', // 가장 큰 chartNumber를 먼저 가져오기 위해 내림차순으로 정렬
      limit: 1, // 결과를 하나만 가져옴
    );
    return result.first['chartNumber'] as int;
  }

// 수정, 삭제 -> user  권한 정한 후 만들 예정
}

class PatientQueueProvider {
  // 환자 대기열 생성
  Future<int> insertPatientQueue(PatientQueue patientQueue) async {
    final db = await SqlDataBase.instance.database;
    return await db.insert(PatientQueue.tableName, patientQueue.toJson());
  }

  // 전체 대기열 가져오기
  Future<List<PatientQueue>> getPatientQueues() async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(PatientQueue.tableName);
    return result.map((json) => PatientQueue.fromJson(json)).toList();
  }

  Future<List<PatientQueue>> getPatientQueuesByAffiliation(
      String affiliation) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.rawQuery('''
    SELECT * FROM ${PatientQueue.tableName} AS pq
    JOIN ${PatientPrivateInfo.tableName} AS ppi ON pq.patientNumber = ppi.patientNumber
    WHERE ppi.affiliation = ?
  ''', [affiliation]);
    return result.map((json) => PatientQueue.fromJson(json)).toList();
  }

  // patient number로 큐에 있는 특정 사람 가져오기
  Future<PatientQueue> getPatientQueueByPatientNum(int patientNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      PatientQueue.tableName,
      where: "${PatientQueueFields.patientNumber} = ?",
      whereArgs: [patientNumber],
    );
    return result.map((json) => PatientQueue.fromJson(json)).first;
  }

  // 대기열의 특정 상황만 가져오기v
  Future<List<PatientQueue>> getPatientQueue(String status) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      PatientQueue.tableName,
      where: "${PatientQueueFields.status} = ?",
      whereArgs: [status],
    );
    return result.map((json) => PatientQueue.fromJson(json)).toList();
  }

  // 환자 대기열 수정
  Future<int> updatePatientQueueState(PatientQueue patientQueue) async {
    final db = await SqlDataBase.instance.database;
    return await db.update(
      PatientQueue.tableName,
      patientQueue.toJson(),
      where:
          "${PatientQueueFields.patientNumber} = ? AND ${PatientQueueFields.queueTicket} = ?",
      whereArgs: [patientQueue.patientNumber, patientQueue.queueTicket],
    );
  }

  // 환자 queue state (대기열) 수정
  Future<void> updatePatientQueueStatus(
      int patientNumber, String newStatus) async {
    final db = await SqlDataBase.instance.database;
    await db.update(
      PatientQueue.tableName,
      {PatientQueueFields.status: newStatus},
      where: '${PatientQueueFields.patientNumber} = ?',
      whereArgs: [patientNumber],
    );
  }

  // 환자 chart number 수정
  Future<void> updatePatientQueueChartNum(
      int patientNumber, int newChartNumber) async {
    final db = await SqlDataBase.instance.database;
    await db.update(
      PatientQueue.tableName,
      {PatientQueueFields.chartNumber: newChartNumber},
      where: '${PatientQueueFields.patientNumber} = ?',
      whereArgs: [patientNumber],
    );
  }

  


  // 특정 환자 대기열 삭제
  Future<int> deletePatientQueue(int patientNumber) async {
    final db = await SqlDataBase.instance.database;
    return await db.delete(
      PatientQueue.tableName,
      where: "${PatientQueueFields.patientNumber} = ?",
      whereArgs: [patientNumber],
    );
  }

  Future<int?> getChartNumberByPatientNumber(int patientNumber) async {
    final db = await SqlDataBase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      PatientQueue.tableName,
      columns: ['chartNumber'],
      where: '${PatientQueueFields.patientNumber} = ?',
      whereArgs: [patientNumber],
    );
    if (maps.isNotEmpty) {
      return maps.first['chartNumber'] as int?;
    }
    return null; // Return null if no chart number is found for the given patient number
  }
}

class PatientVitalProvider {
  // 환자 vital 정보 추가
  Future<int> insertPatientVital(PatientVital patientVital) async {
    final db = await SqlDataBase.instance.database;
    return await db.insert(PatientVital.tableName, patientVital.toJson());
  }

  // 특정 환자 vital 정보 목록
  Future<List<PatientVital>> getPatientVitals(int patientNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      PatientVital.tableName,
      where: "${PatientVitalFields.patientNumber} = ?",
      whereArgs: [patientNumber],
    );
    return result.map((json) => PatientVital.fromJson(json)).toList();
  }

  // 차트에 해당하는 환자 vital
  Future<PatientVital> getPatientVitalByChartNum(int chartNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      PatientVital.tableName,
      where: "${PatientVitalFields.chartNumber} = ?",
      whereArgs: [chartNumber],
    );
    return result.map((json) => PatientVital.fromJson(json)).first;
  }

  Future<PatientVital> getPatientVitalByPatientNum(int patientNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      PatientVital.tableName,
      where: "${PatientVitalFields.patientNumber} = ?",
      whereArgs: [patientNumber],
    );
    return result.map((json) => PatientVital.fromJson(json)).first;
  }

  Future<int> getLargestVitalChartNumber() async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      PatientVital.tableName,
      orderBy: 'chartNumber DESC', // 가장 큰 chartNumber를 먼저 가져오기 위해 내림차순으로 정렬
      limit: 1, // 결과를 하나만 가져옴
    );
    return result.first['chartNumber'] as int;
  }

// 수정, 삭제 -> user  권한 정한 후 만들 예정
}

class ROSProvider {
  // Patient 생성
  Future<int> insertROS(ROS ros) async {
    final db = await SqlDataBase.instance.database;
    return await db.insert(ROS.tableName, ros.toJson());
  }

  Future<void> updateROS(ROS ros) async {
    final db = await SqlDataBase.instance.database;
    await db.update(
      ROS.tableName, ros.toJson(),
      where: 'chartNumber = ?', // 업데이트할 레코드를 찾기 위한 조건
      whereArgs: [ros.chartNumber], // 찾기 위한 조건 매개변수
    );
  }

  // 주어진 차트 번호에 해당하는 ROS 가져오기
  Future<ROS?> getROSByChartNumber(int chartNumber) async {
    final db = await SqlDataBase.instance.database;
    final List<Map<String, dynamic>> result = await db.query(
      ROS.tableName,
      where: "${ROSFields.chartNumber} = ?",
      whereArgs: [chartNumber],
    );

    // 결과가 존재하는지 확인하고 ROS 객체로 변환하여 반환
    if (result.isNotEmpty) {
      return ROS.fromJson(result.first);
    } else {
      return null; // ROS가 없을 경우 null 반환
    }
  }

   // ROS 조회
  Future<List<ROS>> getROSs() async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(ROS.tableName);
    return result.map((json) => ROS.fromJson(json)).toList();
  }
}

class MedicalHistoryProvider {
  // 특정 환자 진료 기록 목록 조회
  Future<List<MedicalHistory>> getMedicalHistorys(int patientNumber) async {
    final db = await SqlDataBase.instance.database;

    final dates = await db.query(
      PreExamination.tableName,
      columns: [
        PreExaminationFields.chartNumber,
        PreExaminationFields.measurementDate
      ],
      where: "${PreExaminationFields.patientNumber} = ?",
      whereArgs: [patientNumber],
    );

    final chartNumbers = dates
        .map((date) => date[PreExaminationFields.chartNumber] as int)
        .toList();

    final diagnosis = await db.query(
      Disease.tableName,
      columns: [DiseaseFields.chartNumber, DiseaseFields.diseaseName],
      where: "${DiseaseFields.chartNumber} IN (${chartNumbers.join(', ')})",
    );

    final acupunctureTreats = await db.query(
      Acupuncture.tableName,
      columns: [
        AcupunctureFields.chartNumber,
        AcupunctureFields.acupunctureType
      ],
      where: "${AcupunctureFields.chartNumber} IN (${chartNumbers.join(', ')})",
    );

    final medicines = await db.query(
      Prescription.tableName,
      columns: [
        PrescriptionFields.chartNumber,
        PrescriptionFields.treatmentName
      ],
      where:
          "${PrescriptionFields.chartNumber} IN (${chartNumbers.join(', ')})",
    );

    final medicalHistorys = dates.map((date) {
      final relatedDiagnosis = diagnosis
          .where((disease) =>
              disease[DiseaseFields.chartNumber] ==
              date[PreExaminationFields.chartNumber])
          .map((disease) => disease[DiseaseFields.diseaseName])
          .join(', ');
      final relatedAcupunctureTreats = acupunctureTreats
          .where((treat) =>
              treat[AcupunctureFields.chartNumber] ==
              date[PreExaminationFields.chartNumber])
          .map((treat) => treat[AcupunctureFields.acupunctureType])
          .join(', ');
      final relatedMedicines = medicines
          .where((medicine) =>
              medicine[PrescriptionFields.chartNumber] ==
              date[PreExaminationFields.chartNumber])
          .map((medicine) => medicine[PrescriptionFields.treatmentName])
          .join(', ');

      return MedicalHistory(
        patientNumber: patientNumber,
        chartNumber: date[PreExaminationFields.chartNumber] as int,
        visitDate: date[PreExaminationFields.measurementDate] as String,
        diagnosis: relatedDiagnosis,
        acupunctureTreat:
            relatedAcupunctureTreats.isEmpty ? null : relatedAcupunctureTreats,
        medicine: relatedMedicines.isEmpty ? null : relatedMedicines,
      );
    }).toList();

    return medicalHistorys;
  }
}

class MedicalRecordProvider {
  Future<int> insertMedicalRecord(MedicalRecord medicalRecord) async {
    final db = await SqlDataBase.instance.database;
    return await db.insert(MedicalRecord.tableName, medicalRecord.toJson());
  }

  Future<MedicalRecord> getMedicalRecord(int chartNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      MedicalRecord.tableName,
      where: "${MedicalRecordFields.chartNumber} = ?",
      whereArgs: [chartNumber],
    );
    return result.map((json) => MedicalRecord.fromJson(json)).first;
  }

  // 수정, 삭제 -> user  권한 정한 후 만들 예정
}

class MedicalImageProvider {
  Future<int> insertMedicalImage(MedicalImage medicalImage) async {
    final db = await SqlDataBase.instance.database;
    return await db.insert(MedicalImage.tableName, medicalImage.toJson());
  }


  Future<List<MedicalImage>> getMedicalImages(int chartNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      MedicalImage.tableName,
      where: "${MedicalImageFields.chartNumber} = ?",
      whereArgs: [chartNumber],
    );
    return result.map((json) => MedicalImage.fromJson(json)).toList();
  }

  Future<MedicalImage> getMedicalImage(int chartNumber, String treatmentArea) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      MedicalImage.tableName,
      where: "${MedicalImageFields.chartNumber} = ? AND ${MedicalImageFields.treatmentArea} = ?",
      whereArgs: [chartNumber, treatmentArea],
    );
    return result.map((json) => MedicalImage.fromJson(json)).first;
  }

  // 수정, 삭제 -> user  권한 정한 후 만들 예정
}

class DiseaseProvider {
  Future<int> insertDisease(Disease disease) async {
    final db = await SqlDataBase.instance.database;
    return await db.insert(Disease.tableName, disease.toJson());
  }

  Future<List<Disease>> getDisease(int chartNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      Disease.tableName,
      where: "${DiseaseFields.chartNumber} = ?",
      whereArgs: [chartNumber],
    );
    return result.map((json) => Disease.fromJson(json)).toList();
  }

  // 수정, 삭제 -> user  권한 정한 후 만들 예정
}

class AcupunctureProvider {
  Future<int> insertAcupuncture(Acupuncture acupuncture) async {
    final db = await SqlDataBase.instance.database;
    return await db.insert(Acupuncture.tableName, acupuncture.toJson());
  }

  Future<List<Acupuncture>> getAcupuncture(int chartNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      Acupuncture.tableName,
      where: "${AcupunctureFields.chartNumber} = ?",
      whereArgs: [chartNumber],
    );
    return result.map((json) => Acupuncture.fromJson(json)).toList();
  }

  // 수정, 삭제 -> user  권한 정한 후 만들 예정
}

class PrescriptionProvider {
  Future<int> insertPrescription(Prescription prescription) async {
    final db = await SqlDataBase.instance.database;
    return await db.insert(Prescription.tableName, prescription.toJson());
  }

  Future<List<Prescription>> getPrescription(int chartNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      Prescription.tableName,
      where: "${PrescriptionFields.chartNumber} = ?",
      whereArgs: [chartNumber],
    );
    return result.map((json) => Prescription.fromJson(json)).toList();
  }

  // 수정, 삭제 -> user  권한 정한 후 만들 예정
}

class DiseaseListProvider {
  Future<List<DiseaseList>> getDiseaseList() async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(DiseaseList.tableName);
    return result.map((json) => DiseaseList.fromJson(json)).toList();
  }

  Future<DiseaseList> getDiseaseCode_kor(String koreanName) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      DiseaseList.tableName,
      where: "${DiseaseListFields.koreanName} = ?",
      whereArgs: [koreanName],
    );
    return result.map((json) => DiseaseList.fromJson(json)).first;
  }

  Future<DiseaseList> getDiseaseCode_en(String englishName) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      DiseaseList.tableName,
      where: "${DiseaseListFields.englishName} = ?",
      whereArgs: [englishName],
    );
    return result.map((json) => DiseaseList.fromJson(json)).first;
  }

  // 관련 병명 출력
  Future<List<DiseaseList>> getDiseaseByKeyword(String keyword) async {
    if (keyword.isEmpty) {
    return [];
    }
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      DiseaseList.tableName,
      where: "${DiseaseListFields.koreanName} LIKE ? OR ${DiseaseListFields.englishName} LIKE ?",
      whereArgs: ['%$keyword%', '%$keyword%'],
    );
    return result.map((json) => DiseaseList.fromJson(json)).toList();
  }
}
