import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_desktop_app/controller/submit_button_controller.dart';
import 'package:my_desktop_app/screens/ros/ros_temperature_sensitive.dart';
import '../../models/ros.dart';
import '../../repository/chart_crud_sql.dart';

class AddRosScreen extends StatefulWidget {
  final int chartNumber;
  const AddRosScreen({Key? key, required this.chartNumber}) : super(key: key);

  @override
  _AddRosScreenState createState() => _AddRosScreenState();
}

class _AddRosScreenState extends State<AddRosScreen> {
  late final GlobalKey<ROSTemperatureSensitiveState> _rosKey;
  final SubmitButtonController submitButtonController =
      Get.put(SubmitButtonController());

  @override
  void initState() {
    super.initState();
    _rosKey = GlobalKey<ROSTemperatureSensitiveState>();
  }

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

    void onCompletionPressed() {
      // Call saveROS method of ROSTemperatureSensitive
      ROSTemperatureSensitiveState? rosState = _rosKey.currentState;
      rosState?.saveROS();
    }

    return Container(
      width: 1124,
      height: 627,
      decoration: BoxDecoration(
        color: const Color(0xFFE2F1F6),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Container(
            width: 191,
            height: 607,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
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
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        const Text(
                          'ROS',
                          style: TextStyle(
                            color: Color(0xFF3FA7C3),
                            fontSize: 16,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 0.09,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            // Close button logic
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 56.20,
                            height: 24,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 3),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFF3FA7C3),
                              ),
                              borderRadius: BorderRadius.circular(5),
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
                        ), // Close button
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            onCompletionPressed();

                            submitButtonController.rosButtonPressed();
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 56.20,
                            height: 24,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 3),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFF3FA7C3),
                              ),
                              borderRadius: BorderRadius.circular(5),
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
                                SvgPicture.asset(
                                    'assets/icons/icon_checked.svg'),
                              ],
                            ),
                          ),
                        ), // Complete button
                        const SizedBox(width: 15),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 903,
                height: 573,
                decoration: const BoxDecoration(
                  color: Color(0xFFD3E8F0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ROSTemperatureSensitive(
                      key: _rosKey, chartNumber: widget.chartNumber),
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
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: const Color(0xFFD3D3D3)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Color(0xFFAFAFAF),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
                height: 0.12,
                letterSpacing: 0.12,
              ),
            ),
            const Spacer(),
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: const Color(0xFFD7D7D7)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
