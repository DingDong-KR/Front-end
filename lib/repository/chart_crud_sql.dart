
import 'dart:collection';

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
  Future<int> insertUser(User user) async {
    final db = await SqlDataBase.instance.database;
    return await db.insert(User.tableName, user.toJson());
  }

  Future<List<User>> getUsers() async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(User.tableName);
    return result.map((json) => User.fromJson(json)).toList();
  }

  Future<User> getUser(String userId) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      User.tableName,
      where: "${UserFields.userId} = ?",
      whereArgs: [userId],
    );
    return result.map((json) => User.fromJson(json)).first;
  }

  Future<int> updateUser(User user) async {
    final db = await SqlDataBase.instance.database;
    return await db.update(
      User.tableName,
      user.toJson(),
      where: "${UserFields.userId} = ?",
      whereArgs: [user.userId],
    );
  }


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
  Future<int> insertUserAffiliation(UserAffiliation userAffiliation) async {
    final db = await SqlDataBase.instance.database;
    return await db.insert(UserAffiliation.tableName, userAffiliation.toJson());
  }

  Future<List<UserAffiliation>> getUserAffiliations() async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(UserAffiliation.tableName);
    return result.map((json) => UserAffiliation.fromJson(json)).toList();
  }

  Future<List<UserAffiliation>> getUserAffiliation(String userId) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      UserAffiliation.tableName,
      where: "${UserAffiliationFields.userId} = ?",
      whereArgs: [userId],
    );
    return result.map((json) => UserAffiliation.fromJson(json)).toList();
  }

  Future<int> updateUserAffiliation(UserAffiliation userAffiliation) async {
    final db = await SqlDataBase.instance.database;
    return await db.update(
      UserAffiliation.tableName,
      userAffiliation.toJson(),
      where: "${UserAffiliationFields.userAffiliationsId} = ?",
      whereArgs: [userAffiliation.userAffiliationsId],
    );
  }


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
    return await db.insert(PatientPrivateInfo.tableName, patientPrivateInfo.toJson());
  }

  // Patient 조회
  Future<List<PatientPrivateInfo>> getPatients() async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(PatientPrivateInfo.tableName);
    return result.map((json) => PatientPrivateInfo.fromJson(json)).toList();
  }

  // Patient 상세 조회
  Future<PatientPrivateInfo> getPatient(int patientNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      PatientPrivateInfo.tableName,
      where: "${PatientPrivateInfoFields.patientNumber} = ?",
      whereArgs: [patientNumber],
    );
    return result.map((json) => PatientPrivateInfo.fromJson(json)).first;
  }
/* 향후 추가 예정
  // Patient 수정
  Future<int> updatePatient(Patient patient) async {
    final db = await SqlDataBase.instance.database;
    return await db.update(
      Patient.tableName,
      patient.toJson(),
      where: "${PatientFields.patientNumber} = ?",
      whereArgs: [patient.patientNumber],
    );
  }

  // Patient 삭제
  Future<int> deletePatient(int patientNumber) async {
    final db = await SqlDataBase.instance.database;
    return await db.delete(
      Patient.tableName,
      where: "${PatientFields.patientNumber} = ?",
      whereArgs: [patientNumber],
    );
  }
*/
}

class PreExaminationProvider {
  Future<int> insertPreExamination(PreExamination preExamination) async {
    final db = await SqlDataBase.instance.database;

    // 이부분 수정필요 (필수 사항, 선택사항 분리 필요)
    var modifiedPreExamination = PreExamination(
      chartNumber: preExamination.chartNumber,
      userId: preExamination.userId,
      patientNumber: preExamination.patientNumber,
      measurementDate: DateTime.now(), // 현재 날짜를 사용
      mainSymptoms: preExamination.mainSymptoms,
      rosKeywords: preExamination.rosKeywords,
      rosDescriptives: preExamination.rosDescriptives,
      bodyType: preExamination.bodyType,
      additionalNotes: preExamination.additionalNotes,
      consentToCollectPersonalInformation: preExamination.consentToCollectPersonalInformation,
    );

    return await db.insert(PreExamination.tableName, modifiedPreExamination.toJson());
  }

  Future<List<PreExamination>> getPreExaminations(int patientNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      PreExamination.tableName,
      where: "${PreExaminationFields.patientNumber} = ?",
      whereArgs: [patientNumber],
    );
    return result.map((json) => PreExamination.fromJson(json)).toList();
  }
  Future<PreExamination> getPreExamination(int chartNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      PreExamination.tableName,
      where: "${PreExaminationFields.chartNumber} = ?",
      whereArgs: [chartNumber],
    );
    return result.map((json) => PreExamination.fromJson(json)).first;
  }
/* 향후 추가 예정
  Future<int> updatePreExamination(PreExamination preExamination) async {
    final db = await SqlDataBase.instance.database;
    return await db.update(
      PreExamination.tableName,
      preExamination.toJson(),
      where: "${PreExaminationFields.chartNumber} = ?",
      whereArgs: [preExamination.chartNumber],
    );
  }

  Future<int> deletePreExamination(int chartNumber) async {
    final db = await SqlDataBase.instance.database;
    return await db.delete(
      PreExamination.tableName,
      where: "${PreExaminationFields.chartNumber} = ?",
      whereArgs: [chartNumber],
    );
  }
*/
}

class PatientQueueProvider {
  Future<int> insertPatientQueue(PatientQueue patientQueue) async {
    final db = await SqlDataBase.instance.database;
    return await db.insert(PatientQueue.tableName, patientQueue.toJson());
  }

  Future<List<PatientQueue>> getPatientQueues() async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(PatientQueue.tableName);
    return result.map((json) => PatientQueue.fromJson(json)).toList();
  }

  Future<PatientQueue> getPatientQueue(int patientNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      PatientQueue.tableName,
      where: "${PatientQueueFields.patientNumber} = ?",
      whereArgs: [patientNumber],
    );
    return result.map((json) => PatientQueue.fromJson(json)).first;
  }

  Future<int> updatePatientQueue(PatientQueue patientQueue) async {
    final db = await SqlDataBase.instance.database;
    return await db.update(
      PatientQueue.tableName,
      patientQueue.toJson(),
      where: "${PatientQueueFields.patientNumber} = ?",
      whereArgs: [patientQueue.patientNumber],
    );
  }


  Future<int> deletePatientQueue(int patientNumber) async {
    final db = await SqlDataBase.instance.database;
    return await db.delete(
      PatientQueue.tableName,
      where: "${PatientQueueFields.patientNumber} = ?",
      whereArgs: [patientNumber],
    );
  }
}

class PatientVitalProvider {
  Future<int> insertPatientVital(PatientVital patientVital) async {
    final db = await SqlDataBase.instance.database;
    return await db.insert(PatientVital.tableName, patientVital.toJson());
  }

  Future<List<PatientVital>> getPatientVitals() async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(PatientVital.tableName);
    return result.map((json) => PatientVital.fromJson(json)).toList();
  }

  Future<PatientVital> getPatientVital(int patientNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      PatientVital.tableName,
      where: "${PatientVitalFields.patientNumber} = ?",
      whereArgs: [patientNumber],
    );
    return result.map((json) => PatientVital.fromJson(json)).first;
  }

  Future<int> updatePatientVital(PatientVital patientVital) async {
    final db = await SqlDataBase.instance.database;
    return await db.update(
      PatientVital.tableName,
      patientVital.toJson(),
      where: "${PatientVitalFields.patientNumber} = ?",
      whereArgs: [patientVital.patientNumber],
    );
  }

  Future<int> deletePatientVital(int patientNumber) async {
    final db = await SqlDataBase.instance.database;
    return await db.delete(
      PatientVital.tableName,
      where: "${PatientVitalFields.patientNumber} = ?",
      whereArgs: [patientNumber],
    );
  }
}

class ROSProvider {
  // Patient 생성
  Future<int> insertROS(ROS ros) async {
    final db = await SqlDataBase.instance.database;
    return await db.insert(ROS.tableName, ros.toJson());
  }

  // Patient 조회
  Future<List<ROS>> getPatients() async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(ROS.tableName);
    return result.map((json) => ROS.fromJson(json)).toList();
  }

  // Patient 상세 조회
  Future<ROS> getPatient(int chartNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      ROS.tableName,
      where: "${ROSFields.chartNumber} = ?",
      whereArgs: [chartNumber],
    );
    return result.map((json) => ROS.fromJson(json)).first;
  }
}
class MedicalRecordProvider {
  Future<int> insertMedicalRecord(MedicalRecord medicalRecord) async {
    final db = await SqlDataBase.instance.database;
    return await db.insert(MedicalRecord.tableName, medicalRecord.toJson());
  }
/* 단순히 진료 기록 리스트 전부 불러오는것
  Future<List<MedicalRecord>> getMedicalRecords() async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(MedicalRecord.tableName);
    return result.map((json) => MedicalRecord.fromJson(json)).toList();
  }
 */
  Future<MedicalRecord> getMedicalRecord(int chartNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      MedicalRecord.tableName,
      where: "${MedicalRecordFields.chartNumber} = ?",
      whereArgs: [chartNumber],
    );
    return result.map((json) => MedicalRecord.fromJson(json)).first;
  }

/*
  Future<int> updateMedicalRecord(MedicalRecord medicalRecord) async {
    final db = await SqlDataBase.instance.database;
    return await db.update(
      MedicalRecord.tableName,
      medicalRecord.toJson(),
      where: "${MedicalRecordFields.chartNumber} = ?",
      whereArgs: [medicalRecord.chartNumber],
    );
  }

  Future<int> deleteMedicalRecord(int chartNumber) async {
    final db = await SqlDataBase.instance.database;
    return await db.delete(
      MedicalRecord.tableName,
      where: "${MedicalRecordFields.chartNumber} = ?",
      whereArgs: [chartNumber],
    );
  }
*/
}

class MedicalImageProvider {
  Future<int> insertMedicalImage(MedicalImage medicalImage) async {
    final db = await SqlDataBase.instance.database;
    return await db.insert(MedicalImage.tableName, medicalImage.toJson());
  }

/*
  Future<List<MedicalImage>> getMedicalImages() async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(MedicalImage.tableName);
    return result.map((json) => MedicalImage.fromJson(json)).toList();
  }
*/

  Future<List<MedicalImage>> getMedicalImage(int chartNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      MedicalImage.tableName,
      where: "${MedicalImageFields.chartNumber} = ?",
      whereArgs: [chartNumber],
    );
    return result.map((json) => MedicalImage.fromJson(json)).toList();
  }

/*
  Future<int> updateMedicalImage(MedicalImage medicalImage) async {
    final db = await SqlDataBase.instance.database;
    return await db.update(
      MedicalImage.tableName,
      medicalImage.toJson(),
      where: "${MedicalImageFields.imageIndex} = ?",
      whereArgs: [medicalImage.imageIndex],
    );
  }

  Future<int> deleteMedicalImage(int imageIndex) async {
    final db = await SqlDataBase.instance.database;
    return await db.delete(
      MedicalImage.tableName,
      where: "${MedicalImageFields.imageIndex} = ?",
      whereArgs: [imageIndex],
    );
  }
*/
}

class DiseaseProvider {
  Future<int> insertDisease(Disease disease) async {
    final db = await SqlDataBase.instance.database;
    return await db.insert(Disease.tableName, disease.toJson());
  }
  /**
      Future<List<Disease>> getDiseases() async {
      final db = await SqlDataBase.instance.database;
      final result = await db.query(Disease.tableName);
      return result.map((json) => Disease.fromJson(json)).toList();
      }
   */
  Future<List<Disease>> getDisease(int chartNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      Disease.tableName,
      where: "${DiseaseFields.chartNumber} = ?",
      whereArgs: [chartNumber],
    );
    return result.map((json) => Disease.fromJson(json)).toList();
  }

/*
  Future<int> updateDisease(Disease disease) async {
    final db = await SqlDataBase.instance.database;
    return await db.update(
      Disease.tableName,
      disease.toJson(),
      where: "${DiseaseFields.diseaseIndex} = ?",
      whereArgs: [disease.diseaseIndex],
    );
  }

  Future<int> deleteDisease(int diseaseIndex) async {
    final db = await SqlDataBase.instance.database;
    return await db.delete(
      Disease.tableName,
      where: "${DiseaseFields.diseaseIndex} = ?",
      whereArgs: [diseaseIndex],
    );
  }
*/
}
class AcupunctureProvider {
  Future<int> insertAcupuncture(Acupuncture acupuncture) async {
    final db = await SqlDataBase.instance.database;
    return await db.insert(Acupuncture.tableName, acupuncture.toJson());
  }
  /**
      Future<List<Acupuncture>> getAcupunctures() async {
      final db = await SqlDataBase.instance.database;
      final result = await db.query(Acupuncture.tableName);
      return result.map((json) => Acupuncture.fromJson(json)).toList();
      }
   */
  Future<List<Acupuncture>> getAcupuncture(int chartNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      Acupuncture.tableName,
      where: "${AcupunctureFields.chartNumber} = ?",
      whereArgs: [chartNumber],
    );
    return result.map((json) => Acupuncture.fromJson(json)).toList();
  }

/*
  Future<int> updateAcupuncture(Acupuncture acupuncture) async {
    final db = await SqlDataBase.instance.database;
    return await db.update(
      Acupuncture.tableName,
      acupuncture.toJson(),
      where: "${AcupunctureFields.acupunctureIndex} = ?",
      whereArgs: [acupuncture.acupunctureIndex],
    );
  }

  Future<int> deleteAcupuncture(int acupunctureIndex) async {
    final db = await SqlDataBase.instance.database;
    return await db.delete(
      Acupuncture.tableName,
      where: "${AcupunctureFields.acupunctureIndex} = ?",
      whereArgs: [acupunctureIndex],
    );
  }
*/
}



class PrescriptionProvider {
  Future<int> insertPrescription(Prescription prescription) async {
    final db = await SqlDataBase.instance.database;
    return await db.insert(Prescription.tableName, prescription.toJson());
  }
/*
  Future<List<Prescription>> getPrescriptions() async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(Prescription.tableName);
    return result.map((json) => Prescription.fromJson(json)).toList();
  }
*/
  Future<List<Prescription>> getPrescription(int chartNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      Prescription.tableName,
      where: "${PrescriptionFields.chartNumber} = ?",
      whereArgs: [chartNumber],
    );
    return result.map((json) => Prescription.fromJson(json)).toList();
  }

/*
  Future<int> updatePrescription(Prescription prescription) async {
    final db = await SqlDataBase.instance.database;
    return await db.update(
      Prescription.tableName,
      prescription.toJson(),
      where: "${PrescriptionFields.prescriptionIndex} = ?",
      whereArgs: [prescription.prescriptionIndex],
    );
  }

  Future<int> deletePrescription(int prescriptionIndex) async {
    final db = await SqlDataBase.instance.database;
    return await db.delete(
      Prescription.tableName,
      where: "${PrescriptionFields.prescriptionIndex} = ?",
      whereArgs: [prescriptionIndex],
    );
  }
*/
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

}
