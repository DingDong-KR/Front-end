import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart'; // 날짜 표기를 위한 라이브러리
import 'package:my_desktop_app/models/medical_history.dart';
import 'package:my_desktop_app/repository/chart_crud_sql.dart';
import 'package:my_desktop_app/repository/chart_sql_db.dart';
import 'package:my_desktop_app/styles/textStyles.dart';

class MedicalHistoryWidget extends StatefulWidget {
  final int patientNumber;
  final double height;
  final double width;

  MedicalHistoryWidget({Key? key, required this.patientNumber,required this.height, required this.width}) : super(key: key);


  @override
  _MedicalHistoryWidgetState createState() => _MedicalHistoryWidgetState();
}

class _MedicalHistoryWidgetState extends State<MedicalHistoryWidget> {
  int _selectedIndex = -1;
  final MedicalHistoryProvider _medicalHistoryProvider =
      MedicalHistoryProvider();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: widget.width,
          height: widget.height,
          padding: const EdgeInsets.all(14),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: const Row(
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
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          '최신순',
                          style: TextStyle(
                            color: Color(0xFF404855),
                            fontSize: 10,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                            height: 0.15,
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
              const SizedBox(
                height: 20,
              ),
              Container(
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 32, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '방문일자',
                        style: TextStyles.text11Style,
                      ),
                      Text(
                        '진단명',
                        style: TextStyles.text11Style,
                      ),
                      Text(
                        '침구치료',
                        style: TextStyles.text11Style,
                      ),
                      Text(
                        '방약',
                        style: TextStyles.text11Style,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              FutureBuilder<List<MedicalHistory>>(
                future: _medicalHistoryProvider
                    .getMedicalHistorys(widget.patientNumber),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final medicalHistorys = snapshot.data;
                    return Column(
                      children: medicalHistorys?.asMap().entries.map((entry) {
                            final index = entry.key;
                            final history = entry.value;
                            return _buildHistoryItem(index, history);
                          }).toList() ??
                          [],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHistoryItem(int index, MedicalHistory item) {
    Color backgroundColor = index % 2 == 0
        ? Colors.white
        : const Color(0xFFE2F1F6); // Alternating colors
    if (_selectedIndex == index) {
      backgroundColor =
          const Color(0xFF00C9FF); // Change to darker blue when clicked
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  item.visitDate != null
                      ? DateFormat('yy.MM.dd')
                          .format(DateTime.parse(item.visitDate))
                      : '', // Format date as yy.MM.dd
                  overflow: TextOverflow.ellipsis, // Handle overflow
                  maxLines: 1, // Show only 1 line
                  style: const TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 11,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    //height: 0.14,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  item.diagnosis ?? '',
                  overflow: TextOverflow.ellipsis, // Handle overflow
                  maxLines: 1, // Show only 1 line
                  style: const TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 11,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    //height: 0.14,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  item.acupunctureTreat ?? '',
                  overflow: TextOverflow.ellipsis, // Handle overflow
                  maxLines: 1, // Show only 1 line
                  style: const TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 11,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    //height: 0.14,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  item.medicine ?? '',
                  overflow: TextOverflow.ellipsis, // Handle overflow
                  maxLines: 1, // Show only 1 line
                  style: const TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 11,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    //height: 0.14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
