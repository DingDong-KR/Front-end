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

  const Ros(
      {super.key,
      required this.chartNumber,
      required this.width,
      required this.height});

  @override
  State<Ros> createState() => _RosState();
}

class _RosState extends State<Ros> {
  late SubmitButtonController submitButtonController;

  bool _isLoadingRos = true;

  // RxString rosString1 = RxString('');
  // RxString rosString2 = RxString('');

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
      try {
        final ROSProvider rosProvider = ROSProvider();
        ros = await rosProvider.getROSByChartNumber(chartNum);

        getHotEasily = ros!.getHotEasily;
        handFootWarm = ros!.handFootWarm;

        setState(() {
          _isLoadingRos = false;
          // rosString1 = RxString(getHotEasily!);
          // rosString2 = RxString(handFootWarm!);
        });

        print('chart num: ${widget.chartNumber}');
        print('getHotEasily: $getHotEasily, handfootwarm: $handFootWarm');
      } catch (e) {
        print('no ros');
      }
    }
  }

  double fontSize = 12;
  void fontSizeMaker() {
    double getHeight = widget.height;
    fontSize = 12;
    if (getHeight == 259) {
      fontSize = 12;
    } else {
      fontSize = 11;
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.chartNumber != 0) {
      print('ros initstate');

      loadRos(widget.chartNumber);
      fontSizeMaker();
    }

    submitButtonController = Get.find<SubmitButtonController>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
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
                        SvgPicture.asset('assets/icons/icon_document.svg'),
                        const SizedBox(width: 5),
                        SvgPicture.asset('assets/icons/icon_right_arrow.svg'),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 13),
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
                            print(
                                'ros controller: ${controller.isRosButtonPressed.value}');
                            //loadRos(widget.chartNumber);
                            controller.isRosButtonPressed.value = false;
                            return _buildRosKeywords('true', 'true');
                          } else {
                            print(
                                'ros controller: ${controller.isRosButtonPressed.value}');
                            return _buildRosKeywords('false', 'false');
                          }
                        }),
                    // Column(
                    //   children: [
                    //     Obx(() => _buildRosKeywords(rosString1, rosString2))
                    //   ],
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

  Widget _buildRosKeywords(String getHotEasily, String handFootWarm) {
    String putGetHotEasily = '';
    String putHandFootWarm = '';

    if (getHotEasily != '') {
      putGetHotEasily = '#더위 $getHotEasily 탐';
    }

    if (handFootWarm != '') {
      if (handFootWarm == '안 따뜻하다') {
        putHandFootWarm = '#손/발 $handFootWarm';
      } else {
        putHandFootWarm = '#$handFootWarm 따뜻한 편';
      }
    }

    print('_buildros: $getHotEasily, $handFootWarm');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _rosKeywordWidget(putGetHotEasily),
        _rosKeywordWidget(putHandFootWarm),
      ],
    );
  }

  Widget _rosKeywordWidget(String keyword) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              keyword,
              style: TextStyle(
                color: const Color(0xFF3EA7C2),
                fontSize: fontSize,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }
}
