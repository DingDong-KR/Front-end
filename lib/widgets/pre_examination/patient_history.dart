import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart'; // 날짜 표기를 위한 라이브러리
import '../../models/patient_history_item.dart';

class PatientHistory extends StatefulWidget {
  final List<PatientHistoryItem> historyItems;

  PatientHistory(this.historyItems); // Constructor to receive historyItems

  @override
  _PatientHistoryState createState() => _PatientHistoryState();
}

class _PatientHistoryState extends State<PatientHistory> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 247,
          height: 574,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 219,
                height: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '진료내역',
                            style: TextStyle(
                              color: Color(0xFF404855),
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 0.12,
                              letterSpacing: 0.12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '최신순',
                                  style: TextStyle(
                                    color: Color(0xFF404855),
                                    fontSize: 10,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    height: 0.15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/icon_down_arrow.svg'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '방문일자',
                      style: TextStyle(
                        color: Color(0xFF404855),
                        fontSize: 11,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 0.14,
                      ),
                    ),
                    Text(
                      '진단명',
                      style: TextStyle(
                        color: Color(0xFF404855),
                        fontSize: 11,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 0.14,
                      ),
                    ),
                    Text(
                      '침구치료',
                      style: TextStyle(
                        color: Color(0xFF404855),
                        fontSize: 11,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 0.14,
                      ),
                    ),
                    Text(
                      '방약',
                      style: TextStyle(
                        color: Color(0xFF404855),
                        fontSize: 11,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 0.14,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Column(
                children: List.generate(
                  31,
                      (index) {
                    final item = index < widget.historyItems.length
                        ? widget.historyItems[index]
                        : null;
                    return Column(
                      children: [
                        _buildHistoryItem(index, item),
                        SizedBox(height: 1), // 1픽셀의 상하 간격 추가
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHistoryItem(int index, PatientHistoryItem? item) {
    Color backgroundColor =
    index % 2 == 0 ? Colors.white : Color(0xFFE2F1F6); // Alternating colors
    if (_selectedIndex == index) {
      backgroundColor = Color(0xFF00C9FF); // Change to darker blue when clicked
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index; // Update selected index
        });
      },
      child: Container(
        width: 223,
        height: 15,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(7.50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              item?.time != null
                  ? DateFormat('yy.MM.dd').format(item!.time!)
                  : '', // Format date as yy.MM.dd
              style: TextStyle(
                color: Color(0xFF404855),
                fontSize: 11,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 0.14,
              ),
            ),
            Text(
              item?.diagnosis ?? '',
              style: TextStyle(
                color: Color(0xFF404855),
                fontSize: 11,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 0.14,
              ),
            ),
            Text(
              item?.acupunctureTreatment ?? '',
              style: TextStyle(
                color: Color(0xFF404855),
                fontSize: 11,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 0.14,
              ),
            ),
            Text(
              item?.medicine ?? '',
              style: TextStyle(
                color: Color(0xFF404855),
                fontSize: 11,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 0.14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
