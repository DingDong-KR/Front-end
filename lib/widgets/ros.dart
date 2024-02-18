import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_desktop_app/controller/submit_button_controller.dart';
import 'package:my_desktop_app/models/ros.dart';
import 'package:my_desktop_app/repository/chart_crud_sql.dart';

import '../screens/ros/add_ros_screen.dart';

class Ros extends StatefulWidget {
  final int chartNumber;
  final double height;
  final double width;

  const Ros({super.key, required this.chartNumber});

  @override
  State<Ros> createState() => _RosState();
}

class _RosState extends State<Ros> {
  late SubmitButtonController submitButtonController;

  bool _isLoadingRos = true;

  String? getHotEasily = '';
  String? handFootWarm = '';
  int? coldShower = -1;
  int? sleepTemperaturePreference = -1;
  int? flushSummer = -1;
  int? flush = -1;
  String? flushCircumstance = '';

  ROS? ros;
  Future<void> loadRos(chartNum) async {
    if (widget.chartNumber != 0) {
      final ROSProvider rosProvider = ROSProvider();
      ros = await rosProvider.getROSByChartNumber(chartNum);

      getHotEasily = ros!.getHotEasily;
      handFootWarm = ros!.handFootWarm;

      setState(() {
        _isLoadingRos = false;
      });

      print('=============================');
      print('getHotEasily: $getHotEasily, handfootwarm: $handFootWarm');
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.chartNumber != 0) {
      print('ros initstate');

      loadRos(widget.chartNumber);
    }

    submitButtonController = Get.find<SubmitButtonController>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
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
                              child:
                                  AddRosScreen(chartNumber: widget.chartNumber),
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
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetBuilder<SubmitButtonController>(
                        init: SubmitButtonController(),
                        builder: (controller) {
                          if (controller.isRosButtonPressed.value) {
                            print('ros controller true');
                            loadRos(widget.chartNumber);
                          }
                          controller.isRosButtonPressed.value = false;
                          return _buildRosKeywords(
                              getHotEasily!, handFootWarm!);
                        }),
                    // const Padding(
                    //   padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.min,
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         '# 오한',
                    //         style: TextStyle(
                    //           color: Color(0xFF3EA7C2),
                    //           fontSize: 12,
                    //           fontFamily: 'Pretendard',
                    //           fontWeight: FontWeight.w400,
                    //           //height: 0.12,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
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

Widget _buildRosKeywords(String getHotEasily, String handFootWarm) {
  print('_buildros: $getHotEasily, $handFootWarm');
  return Column(
    children: [
      _rosKeywordWidget(getHotEasily),
      _rosKeywordWidget(handFootWarm),
    ],
  );
}

Widget _rosKeywordWidget(String keyword) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '# $keyword',
          style: const TextStyle(
            color: Color(0xFF3EA7C2),
            fontSize: 12,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}
