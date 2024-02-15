import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../screens/ros/add_ros_screen.dart';

class Ros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 313,
      height: 259,
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // 요소들을 위쪽부터 정렬
          children: [
            Text(
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
            Spacer(),
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
                          child: AddRosScreen(),
                        ),
                      ),
                    );
                  },
                );
              },
              child:  Container(
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/icon_document.svg'),
                    SizedBox(width: 5),
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
