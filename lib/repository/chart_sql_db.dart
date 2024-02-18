import 'dart:io';
import '../models/ros.dart';

import '../models/patient_vital.dart';
import '../models/patient_queue.dart';

import '../models/patient_private_info.dart';
import '../models/user_affiliation.dart';

import '../models/pre_examination.dart';
import '../models/acupuncture.dart';
import '../models/disease.dart';
import '../models/medical_image.dart';
import '../models/medical_record.dart';

import '../models/prescription.dart';
import '../models/user.dart';
import '../models/disease_list.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

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

    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "chart.db");
    print('데이터베이스의 위치: $path');

    //앱 내부 저장소에 DB가 존재하는 지확인하고 없으면 ASSETS/DB/chart.db를 복사해서 집어넣음
    var exists = await databaseExists(path);

    if (!exists) {
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load('assets/db/chart.db');
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }
    _database = await openDatabase(path,
        version: 2, onCreate: _dataBaseCreate); /*onCreate의 경우 db가 없으면 생성하라는뜻*/
  }

  // DB를 볼수 있는 곳에 위치 시키려 했으나, FLUTTER가 앱 전용 저장소 를 제외하고는 사용 불가 함
  // //해당 앱의 문서 디렉토리에 db 복사본을 저장 -> path_provider 필요
  // Future<void> copyDbToAppDataDirectory() async {
  //   var databasesPath = await getDatabasesPath();
  //   String srcPath = join(databasesPath, 'chart.db');

  //   // Directory appDocDir = await getApplicationDocumentsDirectory(); appDocDir.path

  //   String currentTime = DateFormat('yyyy_MM_dd_HH_mm_ss').format(DateTime.now());
  //   String dstPath = join('../DB/', 'chart_$currentTime.db');

  //   File srcFile = File(srcPath);
  //   await srcFile.copy(dstPath);

  //   print('Copied db to $dstPath');
  // }

  //내부 db에 덮어씌우기
  Future<void> overwriteDbFromAssets() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'chart.db');

    // Delete the existing database file
    var exists = await databaseExists(path);
    if (exists) {
      print('Deleting existing database');
      await deleteDatabase(path);
    }

    // Load database from asset and copy
    print('Creating new copy from asset');
    // ByteData data = await rootBundle.load(join('assets', 'db', 'chart.db'));
    // List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // // Save copied asset to documents
    // await new File(path).writeAsBytes(bytes);

    ByteData data = await rootBundle.load('assets/db/chart.db');
    List<int> bytes =
    data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes, flush: true);

    print('Overwritten db from assets');
  }

  // 일단 작성했으나 필요는 없음
  void _dataBaseCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${User.tableName}(
        ${UserFields.userId} TEXT PRIMARY KEY,
        ${UserFields.name} TEXT NOT NULL,
        ${UserFields.email} TEXT NOT NULL,
        ${UserFields.password} TEXT NOT NULL,
        UNIQUE(${UserFields.userId})
      )
      ''');
    await db.execute('''
      CREATE TABLE ${UserAffiliation.tableName}(
        ${UserAffiliationFields.userAffiliationsId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${UserAffiliationFields.userId} TEXT NOT NULL,
        ${UserAffiliationFields.affiliation} TEXT NOT NULL
      )
      ''');
    await db.execute('''
        CREATE TABLE ${PatientPrivateInfo.tableName}(
          ${PatientPrivateInfoFields.patientNumber} INTEGER PRIMARY KEY AUTOINCREMENT,
          ${PatientPrivateInfoFields.name} TEXT NOT NULL,
          ${PatientPrivateInfoFields.gender} TEXT NOT NULL,
          ${PatientPrivateInfoFields.age} INTEGER NOT NULL,
          ${PatientPrivateInfoFields.address} TEXT NOT NULL,
          ${PatientPrivateInfoFields.socialSecurityNumber} TEXT NOT NULL UNIQUE,
          ${PatientPrivateInfoFields.birthDate} TEXT NOT NULL,
          ${PatientPrivateInfoFields.affiliation} TEXT NOT NULL
        )
        ''');
    await db.execute('''
    CREATE TABLE ${PreExamination.tableName}(
      ${PreExaminationFields.chartNumber} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${PreExaminationFields.userId} TEXT NOT NULL,
      ${PreExaminationFields.patientNumber} INTEGER NOT NULL,
      ${PreExaminationFields.measurementDate} TEXT NOT NULL,
      ${PreExaminationFields.mainSymptoms} TEXT,
      ${PreExaminationFields.rosKeywords} TEXT,
      ${PreExaminationFields.rosDescriptive} TEXT,
      ${PreExaminationFields.bodyType} INTEGER,
      ${PreExaminationFields.additionalNotes} TEXT,
      ${PreExaminationFields.consentToCollectPersonalInformation} INTEGER,
      
      FOREIGN KEY (${PreExaminationFields.patientNumber}) REFERENCES ${PatientPrivateInfo.tableName}(${PatientPrivateInfoFields.patientNumber}) ON DELETE CASCADE
    )
    ''');
    await db.execute('''
      CREATE TABLE ${ROS.tableName}(
        ${ROSFields.chartNumber} INTEGER PRIMARY KEY,
        ${ROSFields.getHotEasily} TEXT,
        ${ROSFields.handFootWarm} TEXT,
        ${ROSFields.coldShower} INTEGER,
        ${ROSFields.sleepTemperaturePreference} INTEGER,
        ${ROSFields.flushSummer} INTEGER,
        ${ROSFields.flush} INTEGER,
        ${ROSFields.flushCircumstance} TEXT
      )
      ''');
    await db.execute('''
      CREATE TABLE ${PatientVital.tableName}(
        ${PatientVitalFields.chartNumber} INTEGER PRIMARY KEY,
        ${PatientVitalFields.patientNumber} INTEGER NOT NULL,
        ${PatientVitalFields.bt} REAL,
        ${PatientVitalFields.dbp} INTEGER,
        ${PatientVitalFields.sbp} INTEGER,
        ${PatientVitalFields.bloodSugar} INTEGER
      )
      ''');
    await db.execute('''
      CREATE TABLE ${PatientQueue.tableName}(
        ${PatientQueueFields.queueTicket} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${PatientQueueFields.patientNumber} INTEGER,
        ${PatientQueueFields.chartNumber} INTEGER,
        ${PatientQueueFields.status} TEXT
      )
      ''');
    await db.execute('''
    CREATE TABLE ${MedicalRecord.tableName}(
      ${MedicalRecordFields.chartNumber} INTEGER PRIMARY KEY,
      ${MedicalRecordFields.userId} TEXT NOT NULL,
      ${MedicalRecordFields.medicalRecord} TEXT NOT NULL
    )
    ''');
    await db.execute('''
    CREATE TABLE ${MedicalImage.tableName}(
      ${MedicalImageFields.imageIndex} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${MedicalImageFields.chartNumber} INTEGER NOT NULL,
      ${MedicalImageFields.treatmentArea} TEXT NOT NULL,
      ${MedicalImageFields.medicalImagePath} TEXT NOT NULL
    )
    ''');
    await db.execute('''
    CREATE TABLE ${Disease.tableName}(
      ${DiseaseFields.diseaseIndex} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${DiseaseFields.primarySecondaryDisease} INTEGER NOT NULL,
      ${DiseaseFields.chartNumber} INTEGER NOT NULL,
      ${DiseaseFields.diseaseCode} TEXT NOT NULL,
      ${DiseaseFields.diseaseName} TEXT NOT NULL
    )
    ''');
    await db.execute('''
    CREATE TABLE ${Acupuncture.tableName}(
      ${AcupunctureFields.acupunctureIndex} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${AcupunctureFields.acupunctureType} INTEGER NOT NULL,
      ${AcupunctureFields.chartNumber} INTEGER NOT NULL,
      ${AcupunctureFields.treatmentPos1} TEXT,
      ${AcupunctureFields.treatmentPos2} TEXT,
      ${AcupunctureFields.treatmentPos3} TEXT,
      ${AcupunctureFields.treatmentPos4} TEXT
    )
    ''');
    await db.execute('''
    CREATE TABLE ${Prescription.tableName}(
      ${PrescriptionFields.prescriptionIndex} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${PrescriptionFields.treatmentName} TEXT NOT NULL,
      ${PrescriptionFields.dosagePerDay} INTEGER NOT NULL,
      ${PrescriptionFields.chartNumber} INTEGER NOT NULL,
      ${PrescriptionFields.instructions} TEXT NOT NULL,
      ${PrescriptionFields.durationOfMedication} INTEGER NOT NULL,
      ${PrescriptionFields.totalAmount} INTEGER NOT NULL
    )
    ''');
    await db.execute('''
      CREATE TABLE ${DiseaseList.tableName}(
        ${DiseaseListFields.diseaseListIndex} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${DiseaseListFields.diseaseCode} TEXT NOT NULL,
        ${DiseaseListFields.koreanName} TEXT,
        ${DiseaseListFields.englishName} TEXT,
        ${DiseaseListFields.completeness} TEXT
      )
      ''');
  }

  void closeDataBase() async {
    if (_database != null) await _database!.close();
  }
}
