import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_desktop_app/screens/ros/ros_temperature_sensitive.dart';
import '../../models/ros.dart';
import '../../repository/chart_crud_sql.dart';
// Import corrected package
import '../../models/ros.dart';

// Import corrected package
import '../../repository/chart_crud_sql.dart';

//ROS 정보를 저장하기 위한 함수
Future<void> saveROS(ROS newROS) async {
  // 데이터베이스에 ROS 정보 추가
  final ROSProvider rosProvider = ROSProvider();
  await rosProvider.insertROS(newROS); // 데이터베이스에 접근할 때 오류 수정
}

class AddRosScreen extends StatelessWidget {
  const AddRosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> rosItems = [
      "추위/더위",
      "땀/음수",
      "기호",
      "식욕/소화",
      "대변",
      "소변",
      "심흉",
      "수면",
      "부녀",
      "두면/견항/인후",
      "전신",
      "관절",
      "감기",
      "컨디션"
    ];

    return Container(
      width: 1124,
      height: 627,
      decoration: ShapeDecoration(
        color: Color(0xFFE2F1F6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Container(
            width: 191,
            height: 607,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
            child: Column(
              children: [
                SizedBox(height: 10),
                for (String item in rosItems) _buildRosItem(item),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 0),
                child: Container(
                  width: 903,
                  height: 46,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Text(
                          'ROS',
                          style: TextStyle(
                            color: Color(0xFF3FA7C3),
                            fontSize: 16,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 0.09,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            // 닫기 버튼이 눌렸을 때 실행되는 로직
                            Navigator.pop(context); // 현재 화면을 닫는 동작을 수행합니다.
                          },
                          child: Container(
                            width: 56.20,
                            height: 24,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 3),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFF3FA7C3)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  '닫기',
                                  style: TextStyle(
                                    color: Color(0xFF3FA7C3),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                    height: 0.12,
                                    letterSpacing: 0.12,
                                  ),
                                ),
                                SvgPicture.asset('assets/icons/icon_x.svg'),
                              ],
                            ),
                          ),
                        ), //닫기 버튼
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            // 완료 버튼이 눌렸을 때 실행되는 로직
                            _saveROS(context);
                          },
                          child: Container(
                            width: 56.20,
                            height: 24,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 3),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFF3FA7C3)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  '완료',
                                  style: TextStyle(
                                    color: Color(0xFF3FA7C3),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                    height: 0.12,
                                    letterSpacing: 0.12,
                                  ),
                                ),
                                SvgPicture.asset('assets/icons/icon_checked.svg'),
                              ],
                            ),
                          ),
                        ), //완료 버튼
                        const SizedBox(width: 15),

                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 903,
                height: 573,
                decoration: ShapeDecoration(
                  color: Color(0xFFD3E8F0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ROSTemperatureSensitive(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildRosItem(String text) {
    return Container(
      width: 171,
      height: 32,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFD3D3D3)),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                color: Color(0xFFAFAFAF),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
                height: 0.12,
                letterSpacing: 0.12,
              ),
            ),
            Spacer(),
            Container(
              width: 12,
              height: 12,
              decoration: ShapeDecoration(
                shape: OvalBorder(
                  side: BorderSide(width: 1, color: Color(0xFFD7D7D7)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // ROS 정보를 생성하고 데이터베이스에 저장하는 함수
  void _saveROS(BuildContext context) async {
    // ROS 정보 생성
    final ROSTemperatureSensitiveState rosState = context.findAncestorStateOfType<ROSTemperatureSensitiveState>()!;
    await rosState.getROS();

    ROS newROS = rosState.getROS(); // 생성된 ROS 정보를 받아옴
    if (newROS != null) {
      await saveROS(newROS); // 생성된 ROS 정보를 데이터베이스에 저장
    } else {
      // ROS 정보가 null인 경우에 대한 처리 추가
      print('ROS 정보가 null입니다.');
    }
  }
}
