import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_desktop_app/models/patient_private_info.dart';
import 'package:my_desktop_app/models/patient_vital.dart';
import 'package:my_desktop_app/repository/chart_crud_sql.dart';

import '../screens/add_vital_screen.dart';

class PatientSimpleInfo extends StatefulWidget {
  final int patientNumber;
  const PatientSimpleInfo({super.key, required this.patientNumber});

  @override
  State<PatientSimpleInfo> createState() => _PatientSimpleInfoState();
}

class _PatientSimpleInfoState extends State<PatientSimpleInfo> {
  bool _isLoadingPatient = true;
  bool _isLoadingVital = true;

  // loadPatient로 patientPrivateInfo에서 받아오기
  String? name;
  String? gender;
  int? age;
  String? birthDate;

  // loadVital로 patientVital에서 받아오기
  double? bt;
  int? dbp;
  int? sbp;
  int? bloodSugar;

  PatientPrivateInfo? patient;
  Future<void> loadPatient(patNum) async {
    if (widget.patientNumber != 0) {
      final PatientProvider patientProvider = PatientProvider();
      patient = await patientProvider.getPatient(patNum);

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
    print('patNum is 0');
  }

  PatientVital? vital;
  Future<void> loadVital(patNum) async {
    if (widget.patientNumber != 0) {
      try {
        final PatientVitalProvider patientVitalProvider =
            PatientVitalProvider();
        vital = await patientVitalProvider.getPatientVital(patNum);

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
    print('patNum is 0');
  }

  @override
  void initState() {
    super.initState();
    if (widget.patientNumber != 0) {
      print('init state: ${widget.patientNumber}');
      loadPatient(widget.patientNumber);
      loadVital(widget.patientNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoadingPatient || _isLoadingVital || widget.patientNumber == 0) {
      // return const Center(
      //   child: CircularProgressIndicator(),
      // );
      if (widget.patientNumber == 0) {
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
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    '환자를 선택해주세요.',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                      height: 0.12,
                      letterSpacing: 0.12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      } else {
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
                  const Text(
                    '바이탈을 추가해주세요.',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                      height: 0.12,
                      letterSpacing: 0.12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    } else {
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
                Text(
                  '${widget.patientNumber}',
                  style: const TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                    letterSpacing: 0.12,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  '$name',
                  style: const TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 0.11,
                    letterSpacing: 0.14,
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  '$gender',
                  style: const TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                  ),
                ),
                const SizedBox(width: 15),
                _buildTextWithIcon('$age', '세'),
                const SizedBox(width: 3),
                _buildText('($birthDate)'),
                const SizedBox(width: 10),
                _buildInfoItem('BT:', '$bt'),
                const SizedBox(width: 10),
                _buildInfoItem('SBP:', '$sbp'),
                const SizedBox(width: 10),
                _buildInfoItem('DBP:', '$dbp'),
                const SizedBox(width: 10),
                _buildInfoItem('혈당:', '$bloodSugar',
                    color: const Color(0xFFFF3120)),
              ],
            ),
            _buildTreatmentButton(),
          ],
        ),
      );
    }
  }

  Widget _buildTextWithIcon(String text, String icon) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF404855),
            fontSize: 12,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            height: 0.12,
            letterSpacing: 0.12,
          ),
        ),
        const SizedBox(width: 3),
        Text(
          icon,
          style: const TextStyle(
            color: Color(0xFF404855),
            fontSize: 12,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            height: 0.12,
          ),
        ),
      ],
    );
  }

  Widget _buildText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF404855),
        fontSize: 12,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w400,
        height: 0.12,
        letterSpacing: 0.12,
      ),
    );
  }

  Widget _buildInfoItem(String label, String value,
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
          value,
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
