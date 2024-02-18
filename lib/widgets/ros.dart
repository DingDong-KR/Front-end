import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/ros/add_ros_screen.dart';

class Ros extends StatelessWidget {
  final int chartNumber;
  final double height;
  final double width;

  const Ros({super.key, required this.chartNumber, required this.width, required this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // 요소들을 위쪽부터 정렬
          children: [
            const Text(
              'ROS',
              style: TextStyle(
                color: Color(0xFF404855),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                letterSpacing: 0.12,
                height: 1, // 높이 설정
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Dialog(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          child: AddRosScreen(chartNumber: chartNumber),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/icon_document.svg'),
                    const SizedBox(width: 5),
                    SvgPicture.asset('assets/icons/icon_right_arrow.svg'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
