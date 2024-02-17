import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_desktop_app/models/patient_private_info.dart';
import '../controller/dropdown_button_controller.dart';
import '../models/patient_queue.dart';
import 'package:my_desktop_app/repository/chart_crud_sql.dart';
import 'package:get/get.dart';

class AddPatientScreen extends StatefulWidget {
  const AddPatientScreen({super.key});

  @override
  State<AddPatientScreen> createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
  String? affiliation;

  final TextEditingController nameController = TextEditingController();
  String selectedGender = ''; // 선택된 성별을 저장할 변수
  final TextEditingController ssnFrontController = TextEditingController();
  final TextEditingController ssnBackController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  // final TextEditingController bdYear = TextEditingController();
  // final TextEditingController bdMonth = TextEditingController();
  // final TextEditingController bdDay = TextEditingController();
  int selectedYear = 1998;
  int selectedMonth = 1;
  int selectedDay = 1;

  int age = 0; // 나이를 저장할 변수
  String ssn = ''; // 주민번호를 저장할 변수
  String bd = ''; // 생년월일을 저장할 변수
  String af = '';

  // 환자 정보를 저장하기 위한 함수
  Future<void> savePatient() async {
    affiliation = Get.find<DropdownButtonController>()
        .currentItem
        .value; //TODO:affiliation 이런식으로 글로벌하게 접근 가능

    // 입력된 값들을 이용하여 Patient 객체 생성
    final PatientPrivateInfo newPatient = PatientPrivateInfo(
        name: nameController.text,
        gender: selectedGender,
        age: age,
        socialSecurityNumber: ssn,
        address: addressController.text,
        birthDate: bd,
        affiliation: affiliation!!
    );

    // 데이터베이스에 환자 정보 추가
    final PatientProvider patientProvider = PatientProvider();
    await patientProvider.insertPatient(newPatient);
  }

  int maxPatientNumber = 0;
  List<PatientPrivateInfo> patients = [];

  // 환자 정보 불러오기 위한 함수
  Future<void> loadPatient() async {
    final PatientProvider patientProvider = PatientProvider();
    patients = await patientProvider.getPatients();
    int patientsLength = patients.length;
    maxPatientNumber = patients[patientsLength - 1].patientNumber!;

    print('length: $patientsLength, maxPatNum: $maxPatientNumber');
  }

  // 대기열 (Queue)에 추가하기 위한 함수
  Future<void> addPatientQueue() async {
    print('addQ patNum: $maxPatientNumber');
    PatientQueue newPatientQueue = PatientQueue(
      patientNumber: maxPatientNumber,
      status: '대기중',
    );

    // 데이터베이스에 queue 추가
    final PatientQueueProvider queueProvider = PatientQueueProvider();
    await queueProvider.insertPatientQueue(newPatientQueue);
  }

  int calculateAge(String birthdate) {
    try {
      // 생년월일 문자열을 DateTime 객체로 변환
      DateTime birthDate = DateTime.parse(birthdate);
      // 현재 시간을 가져옴
      DateTime currentDate = DateTime.now();
      // 나이 계산
      int age = currentDate.year - birthDate.year;

      // 생일이 지났는지 체크
      if (currentDate.month < birthDate.month ||
          (currentDate.month == birthDate.month &&
              currentDate.day < birthDate.day)) {
        age--;
      }

      return age;
    } catch (e) {
      // 변환 중 에러가 발생하면 예외 처리
      print('나이 계산 중 에러 발생: $e');
      return -1; // 오류가 발생한 경우 -1을 반환하거나 다른 처리를 수행할 수 있습니다.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 500,
          height: 600,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFF3FA7C3)),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      '신규환자등록',
                      style: TextStyle(
                        color: Color(0xFF404855),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(width: 70),
                    GestureDetector(
                      onTap: () {
                        // 닫기 버튼이 눌렸을 때 실행되는 로직
                        Navigator.pop(context); // 예시로 현재 화면을 닫는 동작을 수행합니다.
                      },
                      child: Container(
                        width: 56.20,
                        height: 24,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 3),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFF3FA7C3)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              '닫기',
                              style: TextStyle(
                                color: Color(0xFF3FA7C3),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 0.12,
                                letterSpacing: 0.12,
                              ),
                            ),
                            SvgPicture.asset('assets/icons/icon_x.svg'),
                          ],
                        ),
                      ),
                    ), //닫기 버튼
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () async {
                        // 주민번호 앞뒷자리 결합
                        ssn = ssnFrontController.text + ssnBackController.text;
                        // Combine selectedYear, selectedMonth, and selectedDay with the desired format
                        String formattedMonth = selectedMonth < 10
                            ? '0$selectedMonth'
                            : '$selectedMonth';
                        String formattedDay =
                            selectedDay < 10 ? '0$selectedDay' : '$selectedDay';
                        bd = '$selectedYear-$formattedMonth-$formattedDay';
                        print(bd);

                        // 나이
                        age = calculateAge(bd);

                        // 완료 버튼이 눌렸을 때 실행되는 로직
                        print(nameController.text);
                        print(selectedGender);
                        print(ssn);
                        print(age);
                        print(affiliation);
                        // db에 저장시킴
                        savePatient();
                        await loadPatient();
                        addPatientQueue();
                        // // PatientsList의 onPatientAdded 메서드를 호출 (updatePatient 실행하기위함)
                        // PatientsList patientsList = const PatientsList();
                        // patientsList.updatePatient();

                        Navigator.pop(context); // 현재 화면을 닫는 동작을 수행
                      },
                      child: Container(
                        width: 56.20,
                        height: 24,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 3),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFF3FA7C3)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              '완료',
                              style: TextStyle(
                                color: Color(0xFF3FA7C3),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 0.12,
                                letterSpacing: 0.12,
                              ),
                            ),
                            SvgPicture.asset('assets/icons/icon_checked.svg'),
                          ],
                        ),
                      ),
                    ), //완료 버튼
                    const SizedBox(width: 15),
                  ],
                ),
              ), //신규환자등록
              const SizedBox(
                height: 27,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    '환자번호',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0.15,
                    ),
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  Text(
                    '이름',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0.15,
                    ),
                  ),
                  SizedBox(
                    width: 160,
                  ),
                  Text(
                    '성별',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0.15,
                    ),
                  ),
                ],
              ), //환자번호, 이름
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  SizedBox(
                    width: 59,
                    height: 22, // Set the width based on your requirements
                    child: TextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(6),
                        // Another way to limit the input length
                      ],
                      decoration: const InputDecoration(
                        hintText: '000000',
                        hintStyle: TextStyle(
                          color: Color(0xFF3FA7C3),
                          fontSize: 10,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                        ),
                      ),
                      style: const TextStyle(
                        color: Color(0xFF3FA7C3),
                        fontSize: 10,
                        fontFamily: 'Noto Sans KR',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Container(
                      width: 100,
                      height: 22,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF7F7F7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Text(
                          //   '이름',
                          //   style: TextStyle(
                          //     color: Color(0xFFAFAFAF),
                          //     fontSize: 10,
                          //     fontFamily: 'Noto Sans KR',
                          //     fontWeight: FontWeight.w400,
                          //     height: 0.22,
                          //   ),
                          // ),
                          Expanded(
                            // Expand를 사용하지 않으면 튕김. 왜지?
                            child: TextFormField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                hintText: '이름',
                                labelStyle: TextStyle(
                                  color: Color(0xFFAFAFAF),
                                  fontSize: 10,
                                  fontFamily: 'Noto Sans KR',
                                  fontWeight: FontWeight.w400,
                                  height: 0.22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 87,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 50, 0),
                    child: // 성별 선택을 위한 라디오 버튼 그룹
                        Row(
                      children: [
                        Radio(
                          value: '남',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value.toString();
                              print(selectedGender);
                            });
                          },
                        ),
                        const Text('남'),
                        Radio(
                          value: '여',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value.toString();
                              print(selectedGender);
                            });
                          },
                        ),
                        const Text('여'),
                        Radio(
                          value: '기타',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value.toString();
                              print(selectedGender);
                            });
                          },
                        ),
                        const Text('기타'),
                      ],
                    ),
                    // child: Row(
                    //   children: [
                    //     SizedBox(
                    //       width: 16,
                    //       height: 16,
                    //       child: Stack(
                    //         children: [
                    //           Positioned(
                    //             left: 0,
                    //             top: 0,
                    //             child: Container(
                    //               width: 16,
                    //               height: 16,
                    //               decoration: const ShapeDecoration(
                    //                 color: Colors.white,
                    //                 shape: OvalBorder(
                    //                   side: BorderSide(
                    //                       width: 1, color: Color(0xFF3FA7C3)),
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 5,
                    //     ),
                    //     const Text(
                    //       '남',
                    //       style: TextStyle(
                    //         color: Color(0xFF404855),
                    //         fontSize: 12,
                    //         fontFamily: 'Noto Sans KR',
                    //         fontWeight: FontWeight.w400,
                    //         height: 0.15,
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 10,
                    //     ),
                    //     SizedBox(
                    //       width: 16,
                    //       height: 16,
                    //       child: Stack(
                    //         children: [
                    //           Positioned(
                    //             left: 0,
                    //             top: 0,
                    //             child: Container(
                    //               width: 16,
                    //               height: 16,
                    //               decoration: const ShapeDecoration(
                    //                 color: Colors.white,
                    //                 shape: OvalBorder(
                    //                   side: BorderSide(
                    //                       width: 1, color: Color(0xFF3FA7C3)),
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //           Positioned(
                    //             left: 3,
                    //             top: 3,
                    //             child: Container(
                    //               width: 10,
                    //               height: 10,
                    //               decoration: const ShapeDecoration(
                    //                 color: Color(0xFF3FA7C3),
                    //                 shape: OvalBorder(
                    //                   side: BorderSide(
                    //                       width: 1, color: Color(0xFF3FA7C3)),
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 5,
                    //     ),
                    //     const Text(
                    //       '여',
                    //       style: TextStyle(
                    //         color: Color(0xFF404855),
                    //         fontSize: 12,
                    //         fontFamily: 'Noto Sans KR',
                    //         fontWeight: FontWeight.w400,
                    //         height: 0.15,
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 10,
                    //     ),
                    //     SizedBox(
                    //       width: 16,
                    //       height: 16,
                    //       child: Stack(
                    //         children: [
                    //           Positioned(
                    //             left: 0,
                    //             top: 0,
                    //             child: Container(
                    //               width: 16,
                    //               height: 16,
                    //               decoration: const ShapeDecoration(
                    //                 color: Colors.white,
                    //                 shape: OvalBorder(
                    //                   side: BorderSide(
                    //                       width: 1, color: Color(0xFF3FA7C3)),
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 5,
                    //     ),
                    //     const Text(
                    //       '기타',
                    //       style: TextStyle(
                    //         color: Color(0xFF404855),
                    //         fontSize: 12,
                    //         fontFamily: 'Noto Sans KR',
                    //         fontWeight: FontWeight.w400,
                    //         height: 0.15,
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ),
                ],
              ), //000000
              const SizedBox(
                height: 16,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    '주소',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0.15,
                    ),
                  ),
                ],
              ), //주소
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  const Text(
                    '우편번호',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 10,
                      fontFamily: 'Noto Sans KR',
                      fontWeight: FontWeight.w400,
                      height: 0.22,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 67.25,
                    height: 22,
                    padding: const EdgeInsets.only(left: 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(width: 1, color: Color(0xFF3FA7C3)),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          '검색하기',
                          style: TextStyle(
                            color: Color(0xFFAFAFAF),
                            fontSize: 10,
                            fontFamily: 'Noto Sans KR',
                            fontWeight: FontWeight.w400,
                            height: 0.22,
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 5,
                          child:
                              SvgPicture.asset('assets/icons/icon_search.svg'),
                        ),
                      ],
                    ),
                  ),
                ],
              ), //우편번호
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  const Text(
                    '상세주소',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 10,
                      fontFamily: 'Noto Sans KR',
                      fontWeight: FontWeight.w400,
                      height: 0.22,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 369,
                    height: 22,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF7F7F7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Text(
                        //   '상세주소를 입력하세요.',
                        //   style: TextStyle(
                        //     color: Color(0xFFAFAFAF),
                        //     fontSize: 10,
                        //     fontFamily: 'Noto Sans KR',
                        //     fontWeight: FontWeight.w400,
                        //     height: 0.22,
                        //   ),
                        // ),
                        Expanded(
                          // Expand를 사용하지 않으면 튕김. 왜지?
                          child: TextFormField(
                            controller: addressController,
                            decoration: const InputDecoration(
                              hintText: '상세주소를 입력하세요.',
                              labelStyle: TextStyle(
                                color: Color(0xFFAFAFAF),
                                fontSize: 10,
                                fontFamily: 'Noto Sans KR',
                                fontWeight: FontWeight.w400,
                                height: 0.22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ), // 상세주소
              const SizedBox(
                height: 50,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    '주민등록번호',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0.15,
                    ),
                  ),
                ],
              ), //주민등록번호
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  Container(
                    width: 100,
                    height: 22,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF7F7F7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Text(
                        //   '641113',
                        //   style: TextStyle(
                        //     color: Color(0xFFAFAFAF),
                        //     fontSize: 10,
                        //     fontFamily: 'Noto Sans KR',
                        //     fontWeight: FontWeight.w400,
                        //     height: 0.22,
                        //     letterSpacing: 1,
                        //   ),
                        // ),
                        Expanded(
                          // Expand를 사용하지 않으면 튕김. 왜지?
                          child: TextFormField(
                            controller: ssnFrontController,
                            decoration: const InputDecoration(
                              hintText: '앞자리',
                              labelStyle: TextStyle(
                                color: Color(0xFFAFAFAF),
                                fontSize: 10,
                                fontFamily: 'Noto Sans KR',
                                fontWeight: FontWeight.w400,
                                height: 0.22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    '-',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 14,
                      fontFamily: 'Noto Sans KR',
                      fontWeight: FontWeight.w400,
                      height: 0.11,
                      letterSpacing: 1.40,
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 22,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF7F7F7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Text(
                        //   '2205116',
                        //   style: TextStyle(
                        //     color: Color(0xFFAFAFAF),
                        //     fontSize: 10,
                        //     fontFamily: 'Noto Sans KR',
                        //     fontWeight: FontWeight.w400,
                        //     height: 0.22,
                        //     letterSpacing: 1,
                        //   ),
                        // ),
                        Expanded(
                          // Expand를 사용하지 않으면 튕김. 왜지?
                          child: TextFormField(
                            controller: ssnBackController,
                            decoration: const InputDecoration(
                              hintText: '뒷자리',
                              labelStyle: TextStyle(
                                color: Color(0xFFAFAFAF),
                                fontSize: 10,
                                fontFamily: 'Noto Sans KR',
                                fontWeight: FontWeight.w400,
                                height: 0.22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    '생년월일',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0.15,
                    ),
                  ),
                ],
              ), //생년월일
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  DropdownButton<int>(
                    value: selectedYear,
                    items: List.generate(
                      125, // Adjust the range according to your needs
                      (index) => DropdownMenuItem<int>(
                        value: 1900 + index,
                        child: Text((1900 + index).toString()),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedYear = value!;
                      });
                    },
                  ),
                  const Text(
                    '년',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 14,
                      fontFamily: 'Noto Sans KR',
                      fontWeight: FontWeight.w400,
                      height: 0.11,
                      letterSpacing: 1.40,
                    ),
                  ),
                  const SizedBox(width: 15),

                  // Container(
                  //   width: 60,
                  //   height: 22,
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   decoration: ShapeDecoration(
                  //     color: const Color(0xFFF7F7F7),
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(5)),
                  //   ),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       // Text(
                  //       //   '2205116',
                  //       //   style: TextStyle(
                  //       //     color: Color(0xFFAFAFAF),
                  //       //     fontSize: 10,
                  //       //     fontFamily: 'Noto Sans KR',
                  //       //     fontWeight: FontWeight.w400,
                  //       //     height: 0.22,
                  //       //     letterSpacing: 1,
                  //       //   ),
                  //       // ),
                  //       Expanded(
                  //         // Expand를 사용하지 않으면 튕김. 왜지?
                  //         child: TextFormField(
                  //           controller: bdMonth,
                  //           decoration: const InputDecoration(
                  //             hintText: 'mm',
                  //             labelStyle: TextStyle(
                  //               color: Color(0xFFAFAFAF),
                  //               fontSize: 10,
                  //               fontFamily: 'Noto Sans KR',
                  //               fontWeight: FontWeight.w400,
                  //               height: 0.22,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  DropdownButton<int>(
                    value: selectedMonth,
                    items: List.generate(
                      12,
                      (index) => DropdownMenuItem<int>(
                        value: index + 1,
                        child: Text((index + 1).toString()),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedMonth = value!;
                      });
                    },
                  ),
                  const Text(
                    '월',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 14,
                      fontFamily: 'Noto Sans KR',
                      fontWeight: FontWeight.w400,
                      height: 0.11,
                      letterSpacing: 1.40,
                    ),
                  ),
                  // Container(
                  //   width: 60,
                  //   height: 22,
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   decoration: ShapeDecoration(
                  //     color: const Color(0xFFF7F7F7),
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(5)),
                  //   ),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       // Text(
                  //       //   '2205116',
                  //       //   style: TextStyle(
                  //       //     color: Color(0xFFAFAFAF),
                  //       //     fontSize: 10,
                  //       //     fontFamily: 'Noto Sans KR',
                  //       //     fontWeight: FontWeight.w400,
                  //       //     height: 0.22,
                  //       //     letterSpacing: 1,
                  //       //   ),
                  //       // ),
                  //       Expanded(
                  //         // Expand를 사용하지 않으면 튕김. 왜지?
                  //         child: TextFormField(
                  //           controller: bdDay,
                  //           decoration: const InputDecoration(
                  //             hintText: 'dd',
                  //             labelStyle: TextStyle(
                  //               color: Color(0xFFAFAFAF),
                  //               fontSize: 10,
                  //               fontFamily: 'Noto Sans KR',
                  //               fontWeight: FontWeight.w400,
                  //               height: 0.22,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(width: 15),
                  DropdownButton<int>(
                    value: selectedDay,
                    items: List.generate(
                      31,
                      (index) => DropdownMenuItem<int>(
                        value: index + 1,
                        child: Text((index + 1).toString()),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedDay = value!;
                      });
                    },
                  ),
                  const Text(
                    '일',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 14,
                      fontFamily: 'Noto Sans KR',
                      fontWeight: FontWeight.w400,
                      height: 0.11,
                      letterSpacing: 1.40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
