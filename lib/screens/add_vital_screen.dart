import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_desktop_app/repository/chart_crud_sql.dart';
import 'package:flutter/painting.dart'; // Add this import

import '../models/patient_vital.dart';

class AddVitalScreen extends StatefulWidget {
  final int chartNumber;
  final int patientNumber; // 추가: patientNumber 변수 추가

  const AddVitalScreen({Key? key, required this.chartNumber, required this.patientNumber}) : super(key: key);

  @override
  State<AddVitalScreen> createState() => _AddVitalScreenState();
}

class _AddVitalScreenState extends State<AddVitalScreen> {
  int _selectedIndex = 0; // Define _selectedIndex
  final TextEditingController BTController = TextEditingController();
  final TextEditingController SBPController = TextEditingController();
  final TextEditingController DBPController = TextEditingController();
  final TextEditingController BSController = TextEditingController();

  // 환자 바이탈 저장하기 위한 함수
  Future<void> savePatientVital() async {
    // 입력된 값들을 이용하여 PatientVital 객체 생성
    final PatientVital newPatientVital = PatientVital(
      chartNumber: widget.chartNumber,
      patientNumber: widget.patientNumber, // patientNumber 추가
      bt: double.tryParse(BTController.text),
      sbp: int.tryParse(SBPController.text),
      dbp: int.tryParse(DBPController.text),
      bloodSugar: int.tryParse(BSController.text)
    );
    // 데이터베이스에 환자 정보 추가
    final PatientVitalProvider patientVitalProvider = PatientVitalProvider();
    await patientVitalProvider.insertPatientVital(newPatientVital);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 350,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFF3FA7C3)),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'BT/BP/혈당 기록',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.14,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(width: 110),
              GestureDetector(
                onTap: () {
                  // 닫기 버튼이 눌렸을 때 실행되는 로직
                  Navigator.pop(context); // 예시로 현재 화면을 닫는 동작을 수행합니다.
                },
                child: Container(
                  width: 56.20,
                  height: 24,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFF3FA7C3)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
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
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  savePatientVital();
                  Navigator.pop(context); // 현재 화면을 닫는 동작을 수행
                },
                child: Container(
                  width: 56.20,
                  height: 24,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF3FA7C3)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
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
              SizedBox(width: 15),
            ],
          ), //BT/BT/혈당 기록
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(width: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BT',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0.15,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 120,
                    height: 25,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF7F7F7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextField(
                        controller: BTController,
                        decoration: InputDecoration(
                          hintText: 'Body Temperature',
                          hintStyle: TextStyle(
                            color: Color(0xFFAFAFAF),
                            fontSize: 11,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15, // Adjust the vertical padding
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
             SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BP: systole',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0.15,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 120,
                    height: 25,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF7F7F7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextField(
                        controller: SBPController,
                        decoration: InputDecoration(
                          hintText: 'BP in systole',
                          hintStyle: TextStyle(
                            color: Color(0xFFAFAFAF),
                            fontSize: 11,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15, // Adjust the vertical padding
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BP: diastole',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0.15,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 120,
                    height: 25,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF7F7F7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextField(
                        controller: DBPController,
                        decoration: InputDecoration(
                          hintText: 'BP in diastole',
                          hintStyle: TextStyle(
                            color: Color(0xFFAFAFAF),
                            fontSize: 11,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15, // Adjust the vertical padding
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '혈당',
                    style: TextStyle(
                      color: Color(0xFF404855),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0.15,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 120,
                    height: 25,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF7F7F7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextField(
                        controller: BSController,
                        decoration: InputDecoration(
                          hintText: 'Blood Sugar',
                          hintStyle: TextStyle(
                            color: Color(0xFFAFAFAF),
                            fontSize: 11,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15, // Adjust the vertical padding
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30,),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '최근 기록',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 10,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 0.15,
                  ),
                ),
              ],
            ),
          ), //최근 기록
          SizedBox(height: 10,),
          Center(
            child: Container(
              width: 455,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFF7F7F7),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 430,
            height: 150,
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(color: Colors.lightBlue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '방문 일자',
                        style: TextStyle(
                          color: Color(0xFF404855),
                          fontSize: 10,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 0.15,
                        ),
                      ),
                      Text(
                        'BT',
                        style: TextStyle(
                          color: Color(0xFF404855),
                          fontSize: 10,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 0.15,
                        ),
                      ),
                      Text(
                        'BP',
                        style: TextStyle(
                          color: Color(0xFF404855),
                          fontSize: 10,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 0.15,
                        ),
                      ),
                      Text(
                        '혈당',
                        style: TextStyle(
                          color: Color(0xFF404855),
                          fontSize: 10,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 0.15,
                        ),
                      )
                    ],
                  ), //방문일자, BT, BP, 혈당
                ),
                SizedBox(height: 10),
                // Column( //TODO: 환자 바이탈 기록 히스토리 만들기
                //   children: List.generate(
                //     31,
                //         (index) {
                //       final item = index < widget.historyItems.length
                //           ? widget.historyItems[index]
                //           : null;
                //       return Column(
                //         children: [
                //           _buildHistoryItem(index, item),
                //           SizedBox(height: 1), // 1픽셀의 상하 간격 추가
                //         ],
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPatientVital(int index, PatientVital? item) {
    Color backgroundColor =
    index % 2 == 0 ? Colors.white :  Color(0xFFE2F1F6); // 번갈아가면서 색상 변경
    if (_selectedIndex == index) {
      backgroundColor = Color(0xFF00C9FF); // 클릭되었을 때 더 어두운 파란색으로 변경
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index; // 선택된 인덱스 업데이트
        });
      },
      child: Container(
        width: 455,
        height: 25,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(7.50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                item?.chartNumber.toString() ?? '', //TODO: visitDate 대신 chartNumber 사용
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 11,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.14,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                item?.bt?.toString() ?? 'N/A',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 11,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.14,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                item?.sbp?.toString() ?? 'N/A', // bp 대신 sbp 사용
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 11,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.14,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                item?.bloodSugar?.toString() ?? 'N/A',
                style: const TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 11,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
