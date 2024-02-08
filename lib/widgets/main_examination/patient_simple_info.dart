import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PatientSimpleInfo extends StatelessWidget {
  const PatientSimpleInfo({super.key});

  @override
  Widget build(BuildContext context) {
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
              SvgPicture.asset('assets/icons/icon_addPerson.svg'),
              const SizedBox(width: 5),
              const Text(
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
              const SizedBox(width: 5),
              const Text(
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
              const SizedBox(width: 15),
              const Text(
                '여',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.12,
                ),
              ),
              const SizedBox(width: 15),
              _buildTextWithIcon('52', '세'),
              const SizedBox(width: 3),
              _buildText('(1973-06-04)'),
              const SizedBox(width: 10),
              _buildInfoItem('BT:', '12'),
              const SizedBox(width: 10),
              _buildInfoItem('BP:', '50'),
              const SizedBox(width: 10),
              _buildInfoItem('혈당:', '150', color: const Color(0xFFFF3120)),
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
    return Container(
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
    );
  }
}