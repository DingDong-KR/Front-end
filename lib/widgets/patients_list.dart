import 'package:flutter/material.dart';
import '../models/patients_item.dart';

class PatientsList extends StatefulWidget {
  @override
  _PatientsListState createState() => _PatientsListState();
}

class _PatientsListState extends State<PatientsList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 195,
      decoration: BoxDecoration(color: Color(0xFFF7F7F7)),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Padding(
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
                      color: Color(0xFFF7F7F7),
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
                              color: Color(0xFFADE9F9),
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
                                    ? Color(0xFF999999)
                                    : Color(0xFF404855),
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
                                    ? Color(0xFF404855)
                                    : Color(0xFF999999),
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
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  decoration: ShapeDecoration(
                    color: Color(0xFFE2F1F6),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFADE9F9)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 32,
                        height: 13,
                        // Rest of your patient order and status widgets...
                      ),
                      Text(
                        '이수민',
                        style: TextStyle(
                          color: Color(0xFF3EA7C2),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 0.11,
                          letterSpacing: 0.14,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '남,92   팔,허리 아픔', // 환자 세부정보
                            style: TextStyle(
                              color: Color(0xFF404855),
                              fontSize: 11,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 0.14,
                              letterSpacing: 0.11,
                            ),
                          ),
                          Text(
                            '16:04:55', //시간
                            style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 10,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 0.15,
                              letterSpacing: 0.10,
                            ),
                          ),
                        ],
                      ),
                    ],
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
      duration: Duration(milliseconds: 120),
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(1, 0),
    ).animate(_controller);
  }
}
