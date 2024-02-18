import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_desktop_app/controller/chart_number_controller.dart';
import 'package:my_desktop_app/models/patient_private_info.dart';
import 'package:my_desktop_app/models/patient_vital.dart';
import 'package:my_desktop_app/repository/chart_crud_sql.dart';
import '../controller/submit_button_controller.dart';
import '../models/pre_examination.dart';
import '../screens/add_vital_screen.dart';
import '../screens/communication_screen.dart';
import '../styles/textStyles.dart';
import 'package:get/get.dart';

class PatientSimpleInfo extends StatefulWidget {
  final int patientNumber;

  const PatientSimpleInfo({super.key, required this.patientNumber});

  @override
  State<PatientSimpleInfo> createState() => _PatientSimpleInfoState();
}

class _PatientSimpleInfoState extends State<PatientSimpleInfo> {
  late SubmitButtonController submitButtonController;
  late ChartNumberController chartNumberController;

  bool _isLoadingPatient = true;
  bool _isLoadingVital = true;

  // loadPatient로 patientPrivateInfo에서 받아오기
  String? name = '';
  String? gender = '남/여';
  int? age = 0;
  String? birthDate = '';

  // loadVital로 patientVital에서 받아오기
  double? bt = 0.0;
  int? dbp = 0;
  int? sbp = 0;
  int? bloodSugar = 0;

  PatientPrivateInfo? patient;

  Future<void> loadPatient(patNum) async {
    if (widget.patientNumber != 0) {
      final PatientProvider patientProvider = PatientProvider();
      patient = await patientProvider.getPatientByPatientNum(patNum);

      // load한거 변수에 넣어주기
      name = patient!.name;
      gender = patient!.gender;
      age = patient!.age;
      birthDate = patient!.birthDate;

      setState(() {
        _isLoadingPatient = false;
      });

      print(patient!.toJson());
    }
  }

  PatientVital? vital;

  Future<void> loadVital(patNum) async {
    if (widget.patientNumber != 0) {
      try {
        final PatientVitalProvider patientVitalProvider =
            PatientVitalProvider();
        print(patNum);
        vital = await patientVitalProvider.getPatientVitalByPatientNum(patNum);

        // load한거 변수에 넣어주기
        bt = vital!.bt;
        dbp = vital!.dbp;
        sbp = vital!.sbp;
        bloodSugar = vital!.bloodSugar;

        setState(() {
          _isLoadingVital = false;
        });

        print(vital!.toJson());
      } catch (e) {
        print('new patient');
      }
    }
  }

  Future<void> savePreExamination(chartNumber) async {

    //preExamination 객체 만들기
    // final PreExamination newPreExamination = PreExamination(
    //   chartNumber: chartNumberController.chartNumber.value,
    //   patientNumber: widget.patientNumber, // patientNumber 추가
    //   bt: double.tryParse(btController.text),
    //   sbp: int.tryParse(sbpController.text),
    //   dbp: int.tryParse(dbpController.text),
    //   bloodSugar: int.tryParse(bsController.text),
    // );

    final PreExaminationProvider preExaminationProvider = PreExaminationProvider();
    // preExaminationProvider.insertPreExamination(newPreExamination);

  }

  @override
  void initState() {
    super.initState();
    if (widget.patientNumber != 0) {
      loadPatient(widget.patientNumber);
      loadVital(widget.patientNumber);

    }
    submitButtonController =
        Get.find<SubmitButtonController>(); // submitButtonController 초기화
    chartNumberController =
        Get.find<ChartNumberController>(); // chartNumberController 초기화
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1100,
      height: 38,
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(5)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: Dialog(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            child: AddVitalScreen(
                                patientNumber: widget
                                    .patientNumber), // TODO: 차트번호와 환자 번호 전달
                          ),
                        ),
                      );
                    },
                  );
                },
                child: SvgPicture.asset('assets/icons/icon_addPerson.svg'),
              ),
              const SizedBox(width: 5),
              Text('${widget.patientNumber}', style: TextStyles.text14Style),
              const SizedBox(width: 5),
              Text('$name', style: TextStyles.text14Style),
              const SizedBox(width: 10),
              Text('$gender', style: TextStyles.text12Style),
              const SizedBox(width: 10),
              Text(
                '$age세 ',
                style: TextStyles.text12Style,
              ),
              const SizedBox(width: 3),
              Text(
                '$birthDate',
                style: TextStyles.text12Style,
              ),
              const SizedBox(width: 10),
              GetBuilder<SubmitButtonController>(
                init: SubmitButtonController(),
                builder: (controller) {
                  if (controller.isVitalButtonPressed.value) {
                    loadVital(widget.patientNumber);
                  }
                  controller.isVitalButtonPressed.value = false;

                  return _buildSimpleInfo(bt!, sbp!, dbp!, bloodSugar!);
                },
              ),
            ],
          ),
          Row(
            children: [
              Obx(()=>
                  Text(
                'Chart Number: ${chartNumberController.chartNumber.value}',
                style: TextStyles.text14Style,
              )),
              SizedBox(width: 10),
              _buildTreatmentButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleInfo(double bt, int sbp, int dbp, int sugar) {
    return Row(
      children: [
        const SizedBox(width: 10),
        _buildInfoItem('BT:', '$bt'),
        const SizedBox(width: 10),
        _buildInfoItem('SBP:', '$sbp'),
        const SizedBox(width: 10),
        _buildInfoItem('DBP:', '$dbp'),
        const SizedBox(width: 10),
        _buildInfoItem('혈당:', '$bloodSugar', color: const Color(0xFFFF3120)),
      ],
    );
  }

  Widget _buildInfoItem(String label, String? value,
      {Color color = const Color(0xFF404855)}) {
    return Row(
      children: [
        Text(
          '$label ',
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            height: 0.12,
            letterSpacing: 0.12,
          ),
        ),
        Text(
          value ?? '', // if value is null, use empty string
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
            height: 0.12,
            letterSpacing: 0.12,
          ),
        ),
      ],
    );
  }

  Widget _buildTreatmentButton() {
    return GestureDetector(
      onTap: () {
        loadPatient(widget.patientNumber);
        loadVital(widget.patientNumber);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Align(
              alignment: Alignment.center,
              child: Dialog(
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: CommunicationScreen(),
              ),
            );
          },
        );
      },
      child: Container(
        width: 74,
        height: 25,
        decoration: ShapeDecoration(
          color: const Color(0xFF3FA7C3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '진료완료',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
                height: 0.12,
                letterSpacing: 0.12,
              ),
            ),
            const SizedBox(width: 5),
            SvgPicture.asset('assets/icons/icon_send.svg'),
          ],
        ),
      ),
    );
  }
}
