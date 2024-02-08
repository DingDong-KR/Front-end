import 'package:flutter/material.dart';
import '../models/patients_item.dart';

class PatientsList extends StatefulWidget {
  const PatientsList({super.key});

  @override
  _PatientsListState createState() => _PatientsListState();
}

class _PatientsListState extends State<PatientsList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool isSwitchOn = false;
  int? _selectedItemIndex; // 현재 선택된 아이템의 인덱스

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 195,
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
              itemCount: patientsItems.length,
              itemBuilder: (context, index) {
                bool isClicked = _selectedItemIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedItemIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    //클릭시 서식 변경 애니메이션
                    duration: const Duration(milliseconds: 120),
                    width: 105,
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
                                      ? const Color(0xFFD9D9D9) // 클릭된 아이템의 배경색
                                      : const Color(
                                          0xFFADE9F9), // 클릭되지 않은 아이템의 배경색
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.50),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '002',
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
                              const Text(
                                '진료중',
                                style: TextStyle(
                                  color: Color(0xFF11E058),
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
                                padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                                child: Container(
                                  width: 5,
                                  height: 5,
                                  decoration: const ShapeDecoration(
                                    color: Color(0xFF11E058),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Text(
                            '이수민',
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
                                '여,52',
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
                                  color:
                                      Color(0xFF999999), // 클릭되지 않은 아이템의 텍스트 색상
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
                );
              },
            ),
          ),
        ],
      ),
    );
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
  }
}
