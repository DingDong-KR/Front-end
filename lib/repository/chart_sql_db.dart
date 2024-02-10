import 'dart:io';
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
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class SqlDataBase {
  static final SqlDataBase instance = SqlDataBase._instance();

  Database? _database;

  SqlDataBase._instance() {
    _initDataBase();
  }

  /* instance 좀더 유용하게 불러오기 가능 */
  factory SqlDataBase() {
    return instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    await _initDataBase();
    return _database!;
  }

  Future<void> _initDataBase() async {
    // sqflite_common_ffi os 호환 문제 때문에 사용함
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    Directory databasesPath = await getApplicationDocumentsDirectory();
    String path = join(databasesPath.path, 'chart.db');
    print('데이터베이스의 위치: $path');
    _database = await openDatabase(path,
        version: 1, onCreate: _dataBaseCreate); /*onCreate의 경우 db가 없으면 생성하라는뜻 */
  }

  void _dataBaseCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${User.tableName}(
        ${UserFields.userId} TEXT PRIMARY KEY,
        ${UserFields.name} TEXT NOT NULL,
        ${UserFields.email} TEXT NOT NULL,
        ${UserFields.password} TEXT NOT NULL,
        ${UserFields.affiliation} TEXT, 
        UNIQUE(${UserFields.userId})
      )
      '''
    );

    await db.execute(
        '''
        CREATE TABLE ${Patient.tableName}(
          ${PatientFields.patientNumber} INTEGER PRIMARY KEY AUTOINCREMENT,
          ${PatientFields.name} TEXT NOT NULL,
          ${PatientFields.gender} TEXT NOT NULL,
          ${PatientFields.age} INTEGER NOT NULL,
          ${PatientFields.address} TEXT NOT NULL,
          ${PatientFields.socialSecurityNumber} INTEGER NOT NULL UNIQUE,
          ${PatientFields.lastVisitDate} TEXT,
          ${PatientFields.queue} INTEGER
        )
        '''
    );
    await db.execute('''
    CREATE TABLE ${PreExamination.tableName}(
      ${PreExaminationFields.chartNumber} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${PreExaminationFields.userId} TEXT NOT NULL,
      ${PreExaminationFields.patientNumber} INTEGER NOT NULL,
      ${PreExaminationFields.measurementDate} TEXT NOT NULL,
      ${PreExaminationFields.bt} REAL NOT NULL,
      ${PreExaminationFields.bp_h} INTEGER NOT NULL,
      ${PreExaminationFields.bp_l} INTEGER NOT NULL,
      ${PreExaminationFields.bloodSugar} INTEGER NOT NULL,
      ${PreExaminationFields.mainSymptoms} TEXT NOT NULL,
      ${PreExaminationFields.rosKeywords} TEXT NOT NULL,
      ${PreExaminationFields.rosDescriptives[0]} TEXT,
      ${PreExaminationFields.rosDescriptives[1]} TEXT,
      ${PreExaminationFields.bodyType} INTEGER,
      ${PreExaminationFields.ros_detail} TEXT,
      ${PreExaminationFields.additionalNotes} TEXT,
      ${PreExaminationFields.consentToCollectPersonalInformation} INTEGER,
      FOREIGN KEY (${PreExaminationFields.patientNumber}) REFERENCES ${Patient.tableName}(${PatientFields.patientNumber}) ON DELETE CASCADE
    )
    '''
    );
    await db.execute('''
    CREATE TABLE ${MedicalRecord.tableName}(
      ${MedicalRecordFields.chartNumber} INTEGER PRIMARY KEY,
      ${MedicalRecordFields.userId} TEXT NOT NULL,
      ${MedicalRecordFields.medicalRecord} TEXT NOT NULL
    )
    '''
    );
    await db.execute('''
    CREATE TABLE ${MedicalImage.tableName}(
      ${MedicalImageFields.imageIndex} INTEGER PRIMARY KEY,
      ${MedicalImageFields.chartNumber} INTEGER NOT NULL,
      ${MedicalImageFields.treatmentArea} TEXT NOT NULL,
      ${MedicalImageFields.medicalImagePath} TEXT NOT NULL
    )
    '''
    );
    await db.execute('''
    CREATE TABLE ${Disease.tableName}(
      ${DiseaseFields.diseaseIndex} INTEGER PRIMARY KEY,
      ${DiseaseFields.primarySecondaryDisease} INTEGER NOT NULL,
      ${DiseaseFields.chartNumber} INTEGER NOT NULL,
      ${DiseaseFields.diseaseCode} TEXT NOT NULL,
      ${DiseaseFields.diseaseName} TEXT NOT NULL
    )
    '''
    );
    await db.execute('''
    CREATE TABLE ${Acupuncture.tableName}(
      ${AcupunctureFields.acupunctureIndex} INTEGER PRIMARY KEY,
      ${AcupunctureFields.acupunctureType} INTEGER NOT NULL,
      ${AcupunctureFields.chartNumber} INTEGER NOT NULL,
      ${AcupunctureFields.treatmentPos1} TEXT,
      ${AcupunctureFields.treatmentPos2} TEXT,
      ${AcupunctureFields.treatmentPos3} TEXT,
      ${AcupunctureFields.treatmentPos4} TEXT
    )
    '''
    );
    await db.execute('''
    CREATE TABLE ${Prescription.tableName}(
      ${PrescriptionFields.prescriptionIndex} INTEGER PRIMARY KEY,
      ${PrescriptionFields.treatmentName} TEXT NOT NULL,
      ${PrescriptionFields.dosagePerDay} INTEGER NOT NULL,
      ${PrescriptionFields.chartNumber} INTEGER NOT NULL,
      ${PrescriptionFields.instructions} TEXT NOT NULL,
      ${PrescriptionFields.durationOfMedication} INTEGER NOT NULL,
      ${PrescriptionFields.totalAmount} INTEGER NOT NULL
    )
    '''
    );
    await db.execute('''
      CREATE TABLE ${DiseaseList.tableName}(
        ${DiseaseListFields.diseaseCode} TEXT NOT NULL PRIMARY KEY,
        ${DiseaseListFields.koreanName} TEXT,
        ${DiseaseListFields.englishName} TEXT,
        ${DiseaseListFields.completeness} TEXT
      )
      '''
    );
  }

  void closeDataBase() async {
    if (_database != null) await _database!.close();
  }

}

