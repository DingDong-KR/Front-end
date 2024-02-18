import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../screens/ros/add_ros_screen.dart';

class Ros extends StatelessWidget {
  final int chartNumber;

  const Ros({super.key, required this.chartNumber});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 313,
      height: 259,
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
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
                        const Text('ROS 추가 -> '),
                        const SizedBox(width: 5),
                        SvgPicture.asset('assets/icons/icon_document.svg'),
                        const SizedBox(width: 5),
                        SvgPicture.asset('assets/icons/icon_right_arrow.svg'),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '# 식욕부진',
                            style: TextStyle(
                              color: Color(0xFF3EA7C2),
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 0.12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '# 오한',
                            style: TextStyle(
                              color: Color(0xFF3EA7C2),
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 0.12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
