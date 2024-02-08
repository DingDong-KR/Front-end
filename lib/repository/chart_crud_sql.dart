import '../models/pre_examination.dart';
import '../models/acupuncture.dart';
import '../models/disease.dart';
import '../models/medical_image.dart';
import '../models/medical_record.dart';
import '../models/patients.dart';
import '../models/prescription.dart';
import '../models/user.dart';
import '../models/disease_list.dart';
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

class PatientProvider {
  // Patient 생성
  Future<int> insertPatient(Patient patient) async {
    final db = await SqlDataBase.instance.database;
    return await db.insert(Patient.tableName, patient.toJson());
  }

  // Patient 조회
  Future<List<Patient>> getPatients() async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(Patient.tableName);
    return result.map((json) => Patient.fromJson(json)).toList();
  }

  // Patient 상세 조회
  Future<Patient> getPatient(int patientNumber) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      Patient.tableName,
      where: "${PatientFields.patientNumber} = ?",
      whereArgs: [patientNumber],
    );
    return result.map((json) => Patient.fromJson(json)).first;
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
    var modifiedPreExamination = PreExamination(
      chartNumber: preExamination.chartNumber,
      userId: preExamination.userId,
      patientNumber: preExamination.patientNumber,
      measurementDate: DateTime.now(), // 현재 날짜를 사용
      bt: preExamination.bt,
      bp: preExamination.bp,
      bloodSugar: preExamination.bloodSugar,
      mainSymptoms: preExamination.mainSymptoms,
      rosKeywords: preExamination.rosKeywords,
      rosDescriptives: preExamination.rosDescriptives,
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

  Future<DiseaseList> getDiseaseCode(String koreanName) async {
    final db = await SqlDataBase.instance.database;
    final result = await db.query(
      DiseaseList.tableName,
      where: "${DiseaseListFields.koreanName} = ?",
      whereArgs: [koreanName],
    );
    return result.map((json) => DiseaseList.fromJson(json)).first;
  }

}
