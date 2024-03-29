import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:my_desktop_app/screens/forgot_id_screen.dart';
import 'package:my_desktop_app/screens/forgot_password_screen.dart';
import 'package:my_desktop_app/screens/main_screen.dart';
import 'package:my_desktop_app/screens/sign_up_screen.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart'; // Import sqflite package
import 'package:my_desktop_app/models/user.dart'; // Import user model
import 'package:flutter/services.dart' show rootBundle;

import 'dart:io';
import 'dart:async';
import 'dart:convert';

class CommunicationScreen extends StatefulWidget {
  const CommunicationScreen({Key? key}) : super(key: key);

  @override
  _CommunicationScreenState createState() => _CommunicationScreenState();
}

class _CommunicationScreenState extends State<CommunicationScreen> {
  RxString lastSyncTime = RxString('');
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Transform.scale(
            scale: 0.8,
            child: Transform.translate(
                offset: Offset(-100, -100),
                child: SvgPicture.asset(
                    'assets/images/image_background_circle.svg')),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/image_dingdong.svg'),
                SizedBox(height: 50),
                SizedBox(
                  width: 373,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      sendFileOverSocket(
                          'assets/db/chart_send.db', "10.50.33.204", 8080);
                      syncronizeToServer(
                          context); // Update lastSyncTime with the synchronization time
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3FA7C3),
                    ),
                    child: const Text(
                      '데이터 전송하기',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(() => Text(
                        '최근 동기화 ${lastSyncTime.value}',
                        style: TextStyle(
                          color: Color(0xFF404855),
                          fontSize: 13,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      )),
                )
              ],
            ),
          ),
          Transform.scale(
            scale: 0.7,
            child: Transform.translate(
                offset: Offset(500,250),
                child:SvgPicture.asset('assets/images/image_background_dingdong_1.svg')),
          ),
          Transform.scale(
            scale: 0.9,
            child: Transform.translate(
                offset: Offset(550,680),
                child:SvgPicture.asset('assets/images/image_background_dingdong_2.svg')),
          ),
        ],
      ),
    );
  }

  void syncronizeToServer(BuildContext context) {
    // Perform synchronization
    bool syncResult = true; // Replace with the actual synchronization result
    String synchronizationTime = '';
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // Wait for 2 seconds before closing the dialog
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop();
        });
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        );
      },
    );
    if (syncResult) {
      // Save the current time as the synchronization time
      DateTime now = DateTime.now();
      synchronizationTime =
          '${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}:${now.second}';
      // Update the UI with the new synchronization time
      lastSyncTime.value = synchronizationTime;
      // Stop the sync animation
    } else {
      // Stop the sync animation
    }
  }
}

Future<void> sendFileOverSocket(String assetPath, String host, int port) async {
  var completer = Completer<void>();

  try {
    // assets에서 파일 데이터 읽기
    final byteData = await rootBundle.load(assetPath);
    final fileBytes = byteData.buffer.asUint8List();

    // 소켓 연결 생성
    final socket = await Socket.connect(host, port);
    print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');

    // 파일 데이터 전송
    socket.add(fileBytes);
    await socket.flush(); // 데이터 전송이 완료될 때까지 기다립니다.
    print('File sent successfully');

    socket.listen((data) {
      final response = utf8.decode(data);
      print('서버로부터 응답을 받았습니다: $response');
      socket.close();
    }, onDone: () {
      print('서버와의 연결이 종료되었습니다.');
      completer.complete(); // 파일 전송 작업이 완료되었음을 알림
    });
  } catch (e) {
    print('An error occurred: $e');
    completer.completeError('Error sending file');
  }

  return completer.future; // 이 Future를 반환하여 작업의 완료를 기다림
}
