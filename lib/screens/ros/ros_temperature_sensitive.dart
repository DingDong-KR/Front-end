import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/ros.dart';
import '../../repository/chart_crud_sql.dart'; // Import corrected package

class ROSTemperatureSensitive extends StatefulWidget {
  final int chartNumber;

  const ROSTemperatureSensitive({Key? key, required this.chartNumber})
      : super(key: key);

  @override
  ROSTemperatureSensitiveState createState() => ROSTemperatureSensitiveState();
}

class ROSTemperatureSensitiveState extends State<ROSTemperatureSensitive> {
  String? getHotEasily = ''; // 약간, 보통, 많이, 어마어마하게를 저장할 변수

  bool isHandSelected = false;
  bool isFootSelected = false;
  bool isNotWarmSelected = false;
  String handFootWarm = ''; // 손,발,손발,안따뜻하다를 저장할 변수

  // 0: 아니오, 1: 예, 2: 잘 모르겠다
  int coldShower = 0; //봄가을에도 찬물샤워하는 것을 좋아한다
  int sleepTemperaturePreference = 0; //서늘하게 자야 편하다
  int flushSummer = 0; //여름에는 따뜻한 정도가 아니라 화끈거린다
  int flush = 0; //얼굴이 쉽게 붉어지거나 열이 자주 달아오른다
  String flushCircumstance = ''; //언제 얼굴이 달아오르는지

  // 환자 정보를 저장하기 위한 함수
  Future<void> saveROS() async {
    // 입력된 값들을 이용하여 Patient 객체 생성
    final ROS newROS = ROS(
      chartNumber: widget.chartNumber, //TODO: 생성자에서 받아온 차트번호 입력하기
      getHotEasily: getHotEasily,
      handFootWarm: handFootWarm,
      coldShower: coldShower,
      sleepTemperaturePreference: sleepTemperaturePreference,
      flushSummer: flushSummer,
      flush: flush,
      flushCircumstance: flushCircumstance,
    );
    final ROSProvider rosProvider = ROSProvider();
    final existingROS =
        await rosProvider.getROSByChartNumber(newROS.chartNumber);
    if (existingROS != null) {
      // 동일한 차트 번호를 가진 레코드가 이미 있으면 업데이트
      await rosProvider.updateROS(newROS);
      print('ROS record updated: $newROS');
    } else {
      // 동일한 차트 번호를 가진 레코드가 없으면 새로운 레코드로 추가
      await rosProvider.insertROS(newROS);
      print('New ROS record inserted: $newROS');
    }
    // await rosProvider.insertROS(newROS); // 데이터베이스에 접근할 때 오류 수정
    // print(newROS);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 883,
          height: 541,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32.0, 32, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '1. 더위를 탄다.',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 0.11,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const SizedBox(width: 25),
                    _buildGetHotEasilyRadioButton('약간'),
                    const SizedBox(width: 75),
                    _buildGetHotEasilyRadioButton('보통'),
                    const SizedBox(width: 75),
                    _buildGetHotEasilyRadioButton('많이'),
                    const SizedBox(width: 60),
                    _buildGetHotEasilyRadioButton('어마어마하게'),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  '2. 손, 발이 따뜻한 편이다.(중복가능)',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 0.11,
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(width: 30),
                    _buildWarmnessSelectionOption(
                      text: '손',
                      isSelected: isHandSelected,
                      onTap: (selected) {
                        setState(() {
                          isHandSelected = selected;
                          if (selected) {
                            isNotWarmSelected = false;
                            if (isFootSelected == false) {
                              handFootWarm = "손";
                            } else {
                              handFootWarm = "손발";
                            }
                          }
                        });
                      },
                    ),
                    const SizedBox(width: 82),
                    _buildWarmnessSelectionOption(
                      text: '발',
                      isSelected: isFootSelected,
                      onTap: (selected) {
                        setState(() {
                          isFootSelected = selected;
                          if (selected) {
                            isNotWarmSelected = false;
                            if (isHandSelected == false) {
                              handFootWarm = "발";
                            } else {
                              handFootWarm = "손발";
                            }
                          }
                        });
                      },
                    ),
                    const SizedBox(width: 60),
                    _buildWarmnessSelectionOption(
                      text: '안 따뜻하다',
                      isSelected: isNotWarmSelected,
                      onTap: (selected) {
                        setState(() {
                          isNotWarmSelected = selected;
                          if (selected) {
                            isHandSelected = false;
                            isFootSelected = false;
                            handFootWarm = "안 따뜻하다";
                          }
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Row(
                  children: [
                    Text(
                      '3. 해당하는 항목을 모두 클릭하세요.',
                      style: TextStyle(
                        color: Color(0xFF404855),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '    헷갈리는 부분은 ?버튼을 클릭하세요.',
                      style: TextStyle(
                        color: Color(0xFFAFAFAF),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.12,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Y        N        ?',
                      style: TextStyle(
                        color: Color(0xFF3FA7C3),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.12,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          _buildRadioButton(coldShower, (newValue) {
                            setState(() {
                              coldShower = newValue!;
                            });
                          }),
                          const Text('봄 가을에도 찬물샤워를 하는 것을 좋아한다.')
                        ],
                      ),
                      Row(
                        children: [
                          _buildRadioButton(sleepTemperaturePreference,
                              (newValue) {
                            setState(() {
                              sleepTemperaturePreference = newValue!;
                            });
                          }),
                          const Text('따뜻한 잠자리보다는 차라리 서늘하게 자야 몸이 더 편하고 컨디션이 좋다.')
                        ],
                      ),
                      Row(
                        children: [
                          _buildRadioButton(flush, (newValue) {
                            setState(() {
                              flush = newValue!;
                            });
                          }),
                          const Text('(여름에는) 손발이 따뜻한 정도가 아니라 열이 나고 화끈거린다.')
                        ],
                      ),
                      Row(
                        children: [
                          _buildRadioButton(flushSummer, (newValue) {
                            setState(() {
                              flushSummer = newValue!;
                            });
                          }),
                          const Text('얼굴이 쉽게 붉어지거나 상체로 열이 자주 달아오른다.')
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(100, 0, 8, 8),
                      child: SvgPicture.asset(
                          'assets/icons/icon_right_down_arrow.svg'),
                    ),
                    Container(
                      width: 272,
                      height: 22,
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF3FA7C3)),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 12),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              flushCircumstance =
                                  value; // 입력된 텍스트를 flushCircumstance 변수에 할당
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: '언제?',
                            hintStyle: TextStyle(
                              color: Color(0xFFAFAFAF),
                              fontSize: 10,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 0.15,
                              letterSpacing: 0.10,
                            ),
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                            height: 0.15,
                            letterSpacing: 0.10,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGetHotEasilyRadioButton(String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          getHotEasily = text;
        });
      },
      child: Column(
        children: [
          const SizedBox(height: 8),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: const Color(0xFF3FA7C3)),
              color:
                  getHotEasily == text ? const Color(0xFF3FA7C3) : Colors.white,
            ),
            child: getHotEasily == text
                ? Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(height: 30),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF404855),
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
              height: 0.11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarmnessSelectionOption({
    required String text,
    required bool isSelected,
    required Function(bool) onTap,
  }) {
    return GestureDetector(
      onTap: () {
        onTap(!isSelected);
      },
      child: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF3FA7C3) : Colors.white,
              border: Border.all(width: 1, color: const Color(0xFF3FA7C3)),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF404855),
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
              height: 0.11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioButton(int value, void Function(int?) onChanged) {
    return Row(
      children: [
        Radio(
          value: 1,
          groupValue: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF3FA7C3),
        ),
        Radio(
          value: 0,
          groupValue: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF3FA7C3),
        ),
        Radio(
          value: 2,
          groupValue: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF3FA7C3),
        ),
      ],
    );
  }
}
