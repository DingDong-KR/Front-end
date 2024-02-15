import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/add_vital_screen.dart';

class PatientSimpleInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1100,
      height: 38,
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      decoration: ShapeDecoration(
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
                      return const Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: Dialog(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            child: AddVitalScreen(chartNumber: 999,patientNumber: 3),// TODO: 차트번호와 환자 번호 전달
                          ),
                        ),
                      );
                    },
                  );
                },
                child:
                  SvgPicture.asset('assets/icons/icon_addPerson.svg'),
                  ),
              SizedBox(width: 5),
              Text(
                '002',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.12,
                  letterSpacing: 0.12,
                ),
              ),
              SizedBox(width: 5),
              Text(
                '이수민',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.11,
                  letterSpacing: 0.14,
                ),
              ),
              SizedBox(width: 15),
              Text(
                '여',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.12,
                ),
              ),
              SizedBox(width: 15),
              _buildTextWithIcon('52', '세'),
              SizedBox(width: 3),
              _buildText('(1973-06-04)'),
              SizedBox(width: 10),
              _buildInfoItem('BT:', '12'),
              SizedBox(width: 10),
              _buildInfoItem('BP:', '50'),
              SizedBox(width: 10),
              _buildInfoItem('혈당:', '150', color: Color(0xFFFF3120)),
            ],
          ),
          _buildTreatmentButton(),
        ],
      ),
    );
  }

  Widget _buildTextWithIcon(String text, String icon) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            color: Color(0xFF404855),
            fontSize: 12,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            height: 0.12,
            letterSpacing: 0.12,
          ),
        ),
        SizedBox(width: 3),
        Text(
          icon,
          style: TextStyle(
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
      style: TextStyle(
        color: Color(0xFF404855),
        fontSize: 12,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w400,
        height: 0.12,
        letterSpacing: 0.12,
      ),
    );
  }

  Widget _buildInfoItem(String label, String value, {Color color = const Color(0xFF404855)}) {
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
    return Container(
      width: 74,
      height: 25,
      decoration: ShapeDecoration(
        color: Color(0xFF3FA7C3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
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
          SizedBox(width: 5),
          SvgPicture.asset('assets/icons/icon_send.svg'),
        ],
      ),
    );
  }
}
