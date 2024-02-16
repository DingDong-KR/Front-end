import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Ros extends StatelessWidget {
  const Ros({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 122,
        height: 102,
        padding: const EdgeInsets.all(14),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'ROS',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.11,
                  letterSpacing: 0.14,
                ),
              ),
              Spacer(),
              SvgPicture.asset('assets/icons/icon_document.svg'),
              const SizedBox(width: 7),
              SvgPicture.asset('assets/icons/icon_right_arrow.svg'),
            ],
          ),
          // Text(chartNumber: 123)
        ]));
  }
}
