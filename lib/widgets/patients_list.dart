import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_desktop_app/controller/chart_number_controller.dart';
import 'package:my_desktop_app/models/patient_private_info.dart';
import 'package:my_desktop_app/models/patient_queue.dart';
import 'package:my_desktop_app/repository/chart_crud_sql.dart';
import 'package:get/get.dart';
import 'package:my_desktop_app/controller/selected_patient_controller.dart'; // 위에서 만든 컨트롤러 import
import 'package:my_desktop_app/controller/submit_button_controller.dart';
import 'package:my_desktop_app/controller/affiliation_controller.dart';

class PatientsList extends StatefulWidget {
  const PatientsList({super.key});

  @override
  _PatientsListState createState() => _PatientsListState();
}

class _PatientsListState extends State<PatientsList>
    with SingleTickerProviderStateMixin {
  AffiliationController affiliationController= Get.find<AffiliationController>();
  ChartNumberController chartNumberController = Get.find<ChartNumberController>();
  String affiliation = 'default';
  final SelectedPatientController selectedPatientController =
      Get.put(SelectedPatientController()); // 컨트롤러 인스턴스 생성
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool isSwitchOn = false;
  int? _selectedItemIndex; // 현재 선택된 아이템의 인덱스

  bool _isLoadingPatient = true;
  bool _isLoadingQueue = true;

  List<PatientPrivateInfo> patients = [];

  // 환자 정보 불러오기 위한 함수
  Future<void> loadPatients(String affiliation) async {
    final PatientProvider patientProvider = PatientProvider();
    patients = await patientProvider.getPatientsByAffiliation(affiliation);
    setState(() {
      _isLoadingPatient = false;
    });
  }

  List<PatientQueue> patientQueues = [];

  // 환자 상태를 불러오기 위한 함수
  Future<void> loadPatientQueues(String affiliation) async {
    final PatientQueueProvider patientQueueProvider = PatientQueueProvider();
    patientQueues =
        await patientQueueProvider.getPatientQueuesByAffiliation(affiliation);
    setState(() {
      _isLoadingQueue = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(1, 0),
    ).animate(_controller);

    loadPatients(affiliation);
    loadPatientQueues(affiliation);

    ever(affiliationController.currentAffiliation, (String? newItem) {
      //선택한 채널이 변경되면 affiliation 업데이트 하고 새로고침
      // Update the affiliation variable with the new value
      affiliation = newItem ?? '';
      // Call loadPatients and loadPatientQueues whenever the affiliation changes
      loadPatients(affiliation);
      loadPatientQueues(affiliation);
    });

    // 1초마다 화면을 업데이트하는 타이머 설정 TODO:GetX로 비동기처리하기
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (mounted) {
        // 화면이 소멸되면 타이머를 중단하기 위해 체크
        setState(() {
          loadPatients(affiliation);
          loadPatientQueues(affiliation);
        });
      }
    });
    loadPatientQueues(affiliation);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoadingPatient || _isLoadingQueue) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      width: 213,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Text(
                    '환자리스트',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                // Toggle Switch
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSwitchOn = !isSwitchOn;
                      if (isSwitchOn) {
                        _controller.forward();
                      } else {
                        _controller.reverse();
                      }
                    });
                  },
                  child: Container(
                    width: 87,
                    height: 20,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF7F7F7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.50),
                      ),
                    ),
                    child: Stack(
                      children: [
                        SlideTransition(
                          position: _offsetAnimation,
                          child: Container(
                            width: 46,
                            height: 20,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFADE9F9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11.50),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: Text(
                              '본진',
                              style: TextStyle(
                                color: isSwitchOn
                                    ? const Color(0xFF999999)
                                    : const Color(0xFF404855),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: isSwitchOn
                                    ? FontWeight.w400
                                    : FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: Text(
                              '침구',
                              style: TextStyle(
                                color: isSwitchOn
                                    ? const Color(0xFF404855)
                                    : const Color(0xFF999999),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: isSwitchOn
                                    ? FontWeight.w500
                                    : FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ), // 환자 리스트 및 토글 버튼
          ),
          Expanded(
            child: ListView.builder(
              itemCount: patients.length,
              itemBuilder: (context, index) {
                bool isClicked = _selectedItemIndex == index;
                return GestureDetector(
                  onTap: () async {
                    PatientQueueProvider patientQueueProvider = PatientQueueProvider();
                    // 비동기 함수로 변경
                    setState(() {
                      _selectedItemIndex = index;
                      // 선택된 환자의 patientNumber를 설정
                      selectedPatientController
                          .setPatientNumber(patients[index].patientNumber!);
                    });

                    // 비동기로 환자 번호에 해당하는 차트 번호를 가져옴
                    final chartNumber = await patientQueueProvider.getChartNumberByPatientNumber(
                        selectedPatientController.patientNumber.value
                    );
                    print('선택된 환자의 데이터베이스에서 가져온 차트번호: $chartNumber');
                    // 차트 번호를 설정
                    chartNumberController.setChartNumber(chartNumber ?? 0);
                  },

                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
                    child: AnimatedContainer(
                      //클릭시 서식 변경 애니메이션
                      duration: const Duration(milliseconds: 120),
                      width: 213,
                      height: 95, // 아이템의 높이를 조절
                      decoration: ShapeDecoration(
                        color: isClicked
                            ? const Color(0xFFE2F1F6) // 클릭된 아이템의 배경색
                            : const Color(0xFFF7F7F7), // 클릭되지 않은 아이템의 배경색
                        shape: RoundedRectangleBorder(
                          side: isClicked
                              ? const BorderSide(
                                  width: 1, color: Color(0xFFADE9F9))
                              : BorderSide.none,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 32,
                                  height: 13,
                                  decoration: ShapeDecoration(
                                    color: isClicked
                                        ? const Color(
                                            0xFFD9D9D9) // 클릭된 아이템의 배경색
                                        : const Color(
                                            0xFFADE9F9), // 클릭되지 않은 아이템의 배경색
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(14.50),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${patients[index].patientNumber}',
                                      style: TextStyle(
                                        color: isClicked
                                            ? const Color(
                                                0xFF404855) // 클릭된 아이템의 텍스트 색상
                                            : const Color(
                                                0xFF3EA7C2), // 클릭되지 않은 아이템의 텍스트 색상
                                        fontSize: 10,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.10,
                                        height: -0.1,
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  // TODO: list range 오류 떴었음! 수정필요
                                  '${patientQueues[index].status}',
                                  // 's',
                                  style: TextStyle(
                                    color:
                                        (patientQueues[index].status == '진료중')
                                            ? const Color(0xFF12E158)
                                            : const Color(0xFFFFBE17),
                                    // color: Color(0xFF12E158),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.12,
                                    height: 0.0,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 4, 0, 0),
                                  child: Container(
                                    width: 5,
                                    height: 5,
                                    decoration: ShapeDecoration(
                                      color:
                                          (patientQueues[index].status == '진료중')
                                              ? const Color(0xFF12E158)
                                              : const Color(0xFFFFBE17),
                                      // color: Color(0xFF12E158),
                                      shape: const OvalBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Text(
                              patients[index].name,
                              style: TextStyle(
                                color: isClicked
                                    ? const Color(0xFF404855) // 클릭된 아이템의 텍스트 색상
                                    : const Color(
                                        0xFF3EA7C2), // 클릭되지 않은 아이템의 텍스트 색상
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: -1, // 조정된 부분
                                letterSpacing: 0.14,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Row(
                              children: [
                                Text(
                                  '${patients[index].gender}, ${patients[index].age}세',
                                  style: TextStyle(
                                    color: isClicked
                                        ? const Color(
                                            0xFF404855) // 클릭된 아이템의 텍스트 색상
                                        : const Color(
                                            0xFF3EA7C2), // 클릭되지 않은 아이템의 텍스트 색상
                                    fontSize: 11,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    height: 0.14,
                                    letterSpacing: 0.11,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  '다리아픔',
                                  style: TextStyle(
                                    color: isClicked
                                        ? const Color(
                                            0xFF404855) // 클릭된 아이템의 텍스트 색상
                                        : const Color(
                                            0xFF3EA7C2), // 클릭되지 않은 아이템의 텍스트 색상
                                    fontSize: 11,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    height: 0.14,
                                    letterSpacing: 0.11,
                                  ),
                                ),
                                const Spacer(),
                                const Text(
                                  '14:01:25',
                                  style: TextStyle(
                                    color: Color(
                                        0xFF999999), // 클릭되지 않은 아이템의 텍스트 색상
                                    fontSize: 10,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    height: 0.15,
                                    letterSpacing: 0.10,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
